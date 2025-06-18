# Multilingual Online Dictionary (Albanian - English - French)

This project is an online dictionary system built with [BaseX](http://basex.org/) using XQuery and RESTXQ, supporting translations and entries in Albanian, English, and French.

## 📁 Structure

- `basex/add_entry.xq`: API to add new dictionary entries
- `basex/dictionairy_browse.xq`: Browse and search existing entries
- `basex/index.xq`: Homepage or default route handler

## 🛠️ Requirements

- [BaseX 11+](https://basex.org/download/)
- Java 11 or higher (Adoptium recommended)
- A running BaseX HTTP server (see `basexhttp.bat`)

## 🚀 How to Run

1. Place the `.xq` files into `webapp` folder in BaseX directory.
2. Start the BaseX HTTP server:
   ```bash
   basexhttp.bat -d
   ```
3. Access via browser at: `http://localhost:8984`


## ✍️ License

MIT License.
