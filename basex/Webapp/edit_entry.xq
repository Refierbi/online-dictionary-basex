module namespace page = 'http://basex.org/modules/web-page';

declare
  %rest:path("/dictionary/edit-entry")
  %rest:GET
  %output:method("html")
  %output:doctype-system("about:legacy-compat")
function page:edit() {
  let $id := request:parameter("id")
  let $entry := db:get("DICTIONARY")/bdd/entry[lemma[@n='orth'] = $id]

  return
  <html>
    <head>
      <title>Edit Dictionary Entry</title>
      <meta charset="UTF-8"/>
      <style>
        body {{ font-family: Arial, sans-serif; margin: 0; padding: 0; }}
        header {{ 
          background-color: #E41E25; 
          color: white;
          padding: 15px 20px;
          text-align: center;
          display: flex;
          justify-content: center;
          align-items: center;
          position: relative;
        }}
        .flag-icon {{
          position: absolute;
          right: 20px;
          width: 40px;
          height: 28px;
          background-color: #E41E25; 
          display: flex;
          justify-content: center;
          align-items: center;
        }}
        .double-eagle {{
          width: 24px;
          height: 24px;
          color: #000000; 
        }}
        .content {{
          margin: 20px;
        }}
        .form-group {{ 
          margin-bottom: 15px; 
        }}
        label {{ 
          display: block; 
          margin-bottom: 5px; 
          font-weight: bold; 
          color: #000000; 
        }}
        input, textarea {{ 
          width: 100%; 
          padding: 8px; 
          border: 1px solid #ccc; 
          border-radius: 3px; 
        }}
        textarea {{ 
          height: 100px; 
        }}
        .save-btn {{ 
          background: #E41E25; 
          color: white; 
          border: none; 
          padding: 8px 15px;
          cursor: pointer;
          border-radius: 3px;
          margin-right: 10px;
        }}
        .cancel-btn {{ 
          background: #000000; 
          color: white; 
          border: none; 
          padding: 8px 15px;
          cursor: pointer;
          border-radius: 3px;
        }}
      </style>
    </head>
    <body>
      <header>
        <h1>Edit Dictionary Entry</h1>
        <div class="flag-icon">
          <!-- Simplified Albanian flag symbol -->
          <svg class="double-eagle" viewBox="0 0 300 300" xmlns="http://www.w3.org/2000/svg">
            <path d="M150,20 C120,40 100,60 90,100 C80,140 90,180 150,220 C210,180 220,140 210,100 C200,60 180,40 150,20 Z" fill="black"/>
            <path d="M150,70 C140,75 135,80 132,90 C129,100 132,110 150,120 C168,110 171,100 168,90 C165,80 160,75 150,70 Z" fill="#E41E25"/>
          </svg>
        </div>
      </header>
      
      <div class="content">
        <form action="/dictionary/save-entry" method="post">
          <input type="hidden" name="original-orth" value="{$id}"/>
          
          <div class="form-group">
            <label>Orthographic Form:</label>
            <input type="text" name="orth" value="{$entry/lemma[@n='orth']/text()}"/>
          </div>
          
          <div class="form-group">
            <label>Phonetic Form:</label>
            <input type="text" name="phon" value="{$entry/lemma[@n='phon']/text()}"/>
          </div>
          
          <div class="form-group">
            <label>Parts of Speech:</label>
            <input type="text" name="pos" value="{string-join($entry/form/pos/text(), ', ')}"/>
          </div>

          <div class="form-group">
            <label>Definition (English):</label>
            <textarea name="definition_en">{$entry/def_en/text()}</textarea>
          </div>

          <div class="form-group">
            <label>Definition (French):</label>
            <textarea name="definition_fr">{$entry/def_fr/text()}</textarea>
          </div>

          <div class="form-group">
            <label>Definition (Albanian):</label>
            <textarea name="definition_sq">{$entry/def_sq/text()}</textarea>
          </div>
          
          <button type="submit" class="save-btn">Save Changes</button>
          <button type="button" class="cancel-btn" onclick="window.location.href='/dictionary/browse'">Cancel</button>
        </form>
      </div>
    </body>
  </html>
};
