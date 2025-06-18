module namespace page = 'http://basex.org/modules/web-page';

import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace db = "http://basex.org/modules/db";
import module namespace http = "http://expath.org/ns/http-client";

(: 🔁 1. Updating logic :)
declare
  %rest:path("/dictionary/save-entry-data")
  %rest:POST
  %rest:form-param("original-orth", "{$original-orth}")
  %rest:form-param("orth", "{$orth}")
  %rest:form-param("phon", "{$phon}")
  %rest:form-param("pos", "{$pos}")
  %rest:form-param("definition", "{$definition}")
  %rest:form-param("definition_en", "{$definition_en}")
  %rest:form-param("definition_fr", "{$definition_fr}")
  %rest:form-param("definition_sq", "{$definition_sq}")
  %rest:form-param("example", "{$example}")
  %rest:form-param("origin", "{$origin}")
  %rest:form-param("synonyms", "{$synonyms}")
  %rest:form-param("antonyms", "{$antonyms}")
  %updating
function page:save-entry-data(
  $original-orth, $orth, $phon, $pos,
  $definition, $definition_en, $definition_fr, $definition_sq,
  $example, $origin, $synonyms, $antonyms
) {
  let $doc := db:get("DICTIONARY")/bdd
  let $entry := $doc/entry[lemma[@n="orth"] = $original-orth]
  let $pos-values := tokenize($pos, ',\s*')
  let $synonyms-list := tokenize($synonyms, ',\s*')
  let $antonyms-list := tokenize($antonyms, ',\s*')

  return (
    if ($entry) then (
      replace value of node $entry/lemma[@n="orth"] with $orth,
      replace value of node $entry/lemma[@n="phon"] with $phon,
      replace value of node $entry/def with $definition,
      replace value of node $entry/def_en with $definition_en,
      replace value of node $entry/def_fr with $definition_fr,
      replace value of node $entry/def_sq with $definition_sq,
      replace value of node $entry/example with $example,
      replace value of node $entry/origin with $origin,
      delete node $entry/form/pos,
      insert node (for $p in $pos-values return <pos>{normalize-space($p)}</pos>) into $entry/form,
      if ($entry/synonyms) then delete node $entry/synonyms else (),
      if ($synonyms) then insert node <synonyms>{ for $s in $synonyms-list return <synonym>{normalize-space($s)}</synonym> }</synonyms> into $entry,
      if ($entry/antonyms) then delete node $entry/antonyms else (),
      if ($antonyms) then insert node <antonyms>{ for $a in $antonyms-list return <antonym>{normalize-space($a)}</antonym> }</antonyms> into $entry
    )
    else (
      insert node
        <entry>
          <lemma n="orth">{$orth}</lemma>
          <lemma n="phon">{$phon}</lemma>
          <form>{ for $p in $pos-values return <pos>{normalize-space($p)}</pos> }</form>
          <def>{$definition}</def>
          <def_en>{$definition_en}</def_en>
          <def_fr>{$definition_fr}</def_fr>
          <def_sq>{$definition_sq}</def_sq>
          <example>{$example}</example>
          <origin>{$origin}</origin>
          {
            if ($synonyms) then <synonyms>{ for $s in $synonyms-list return <synonym>{normalize-space($s)}</synonym> }</synonyms> else (),
            if ($antonyms) then <antonyms>{ for $a in $antonyms-list return <antonym>{normalize-space($a)}</antonym> }</antonyms> else ()
          }
        </entry>
      into $doc
    )
  )
};

(: ✅ 2. Separate redirect response :)
declare
  %rest:path("/dictionary/save-entry")
  %rest:POST
function page:redirect-after-save() {
  <rest:response>
    <http:response status="302">
      <http:header name="Location" value="/dictionary/browse"/>
    </http:response>
  </rest:response>
};
