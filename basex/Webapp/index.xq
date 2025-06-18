module namespace page = 'http://basex.org/modules/web-page';

declare
  %rest:path("/dictionary")
  %rest:GET
  %output:method("html")
  %output:doctype-system("about:legacy-compat")
function page:index() {
  <html>
    <head>
      <title>Albanian Dictionary Project</title>
      <meta charset="UTF-8"/>
      <style>
        body {{ 
          font-family: Arial, sans-serif; 
          margin: 0; 
          padding: 0;
          background-color: #f5f5f5;
          display: flex;
          flex-direction: column;
          align-items: center;
          min-height: 100vh;
        }}
        .container {{
          max-width: 800px;
          width: 100%;
          padding: 20px;
        }}
        header {{
          background-color: #E41E25; 
          color: white;
          width: 100%;
          padding: 20px 0;
          text-align: center;
          display: flex;
          justify-content: center;
          align-items: center;
          position: relative;
        }}
        .flag-icon {{
          position: absolute;
          right: 30px;
          width: 60px;
          height: 42px;
          background-color: #E41E25;
          display: flex;
          justify-content: center;
          align-items: center;
        }}
        .double-eagle {{
          width: 36px;
          height: 36px;
          color: #000000; 
        }}
        .btn {{
          display: inline-block;
          background: #E41E25; 
          color: white;
          padding: 10px 20px;
          margin: 10px 0;
          text-decoration: none;
          border-radius: 4px;
          font-weight: bold;
        }}
        .about {{
          background: white;
          padding: 20px;
          border-radius: 5px;
          margin-top: 20px;
          box-shadow: 0 2px 4px rgba(0,0,0,0.1);
          border-left: 4px solid #E41E25; 
        }}
        .language-section {{
          margin-bottom: 20px;
          padding-bottom: 15px;
          border-bottom: 1px solid #eee;
        }}
        .language-section:last-child {{
          border-bottom: none;
          margin-bottom: 0;
          padding-bottom: 0;
        }}
        .language-section h3 {{
          color: #E41E25;
          margin-top: 15px;
          margin-bottom: 10px;
          font-size: 1.2em;
        }}
        .footer {{
          margin-top: 30px;
          text-align: right;
          font-style: italic;
          color: #666;
        }}
      </style>
    </head>
    <body>
      <header>
        <h1>Albanian Dictionary Project</h1>
        <div class="flag-icon">
          <svg class="double-eagle" viewBox="0 0 300 300" xmlns="http://www.w3.org/2000/svg">
            <path d="M150,20 C120,40 100,60 90,100 C80,140 90,180 150,220 C210,180 220,140 210,100 C200,60 180,40 150,20 Z" fill="black"/>
            <path d="M150,70 C140,75 135,80 132,90 C129,100 132,110 150,120 C168,110 171,100 168,90 C165,80 160,75 150,70 Z" fill="#E41E25"/>
          </svg>
        </div>
      </header>
      
      <div class="container">
        <div style="text-align: center; margin: 30px 0;">
          <a href="/dictionary/browse" class="btn">Browse Dictionary</a>
        </div>
        
        <div class="about">
          <h2>About This Project / À propos de ce projet / Rreth këtij projekti</h2>
          
          <div class="language-section">
            <h3>English</h3>
            <p>This online Albanian dictionary provides access to a comprehensive collection of Albanian terms with their definitions, phonetic representations, and grammatical information.</p>
            <p>Users can browse the dictionary, search for specific terms, and contribute by editing existing entries to improve accuracy and completeness.</p>
          </div>
          
          <div class="language-section">
            <h3>Français</h3>
            <p>Ce dictionnaire albanais en ligne donne accès à une collection complète de termes albanais avec leurs définitions, représentations phonétiques et informations grammaticales.</p>
            <p>Les utilisateurs peuvent parcourir le dictionnaire, rechercher des termes spécifiques et contribuer en modifiant les entrées existantes pour améliorer la précision et lexhaustivité.</p>
          </div>
          
          <div class="language-section">
            <h3>Shqip</h3>
            <p>Ky fjalor shqip në internet ofron qasje në një koleksion gjithëpërfshirës të termave shqiptarë me përkufizimet e tyre, paraqitjet fonetike dhe informacionin gramatikor.</p>
            <p>Përdoruesit mund të shfletojnë fjalorin, të kërkojnë terma specifike dhe të kontribuojnë duke redaktuar shënimet ekzistuese për të përmirësuar saktësinë dhe plotësinë.</p>
          </div>
        </div>
        
        <div class="footer">
          Created by Refierbi IBRO
        </div>
      </div>
    </body>
  </html>
};