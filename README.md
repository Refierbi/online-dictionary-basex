
# Online Dictionary Project

This project is an online dictionary application built with **BaseX** XML database and **XQuery RESTXQ** modules for managing dictionary entries in multiple languages (English, French, Albanian). The main functionalities include adding, browsing, editing, and saving dictionary entries through a RESTful web interface.

---

## Folder and File Structure

### `Basex/webapp/`

This folder contains the core XQuery scripts and RESTXQ modules that power the online dictionary web application.

- **add_entry.xq**  
  Handles the user interface and logic for adding a new dictionary entry. This script renders the form where users can input new words and their translations or definitions.

- **dictionairy_browse.xq**  
  (Note: "dictionairy" likely a typo; consider renaming to `dictionary_browse.xq`)  
  Allows users to browse the existing dictionary entries. It queries the BaseX database and displays dictionary content in a user-friendly format.

- **edit_entry.xq**  
  Provides the interface and backend logic to edit existing dictionary entries. Users can modify word definitions or translations.

- **save_entry.xq**  
  Processes the saving of new or edited dictionary entries into the BaseX database. It handles data validation and updates the XML data store accordingly.

- **index.xq**  
  Acts as the main entry point or homepage of the dictionary web application. It may redirect to browsing or provide general navigation for the dictionary features.

- **restxq.xqm**  
  Contains RESTXQ module declarations and reusable functions for RESTful endpoints used throughout the webapp. This module manages routing, request handling, and common helper functions.

---

### `dictionary.xml`

The main XML data file that serves as the database of dictionary entries. It stores all words, translations, definitions, and related metadata in a structured XML format, which the XQuery scripts query and manipulate.

---

### `license`

The file containing the licensing terms for this project. Please review to understand the usage, distribution, and modification rights.

---

### `readMe`

This README file providing an overview of the project, file descriptions, and instructions for setup and usage.

---

## Setup Guide

1. **Install BaseX**  
   Download and install BaseX from [https://basex.org/](https://basex.org/). Ensure you have Java 11 or higher installed, as BaseX requires it.

2. **Create a BaseX Database**  
   Open the BaseX GUI or use the command line to create a new database (e.g., `DictionaryDB`) and import the `dictionary.xml` file as the initial dataset.

3. **Deploy the Web Application**  
   - Place the contents of the `webapp` folder into the BaseX webapp directory or configure the BaseX HTTP server to point to these XQuery scripts.  
   - Make sure the RESTXQ module (`restxq.xqm`) is accessible and properly referenced by the other scripts.

4. **Start the BaseX HTTP Server**  
   Run the BaseX HTTP server with RESTXQ enabled, typically using `basexhttp` command.

5. **Access the Online Dictionary**  
   Open a browser and navigate to `http://localhost:8984/rest/index.xq` (or your server’s equivalent URL) to access the dictionary interface.

---

## Usage Examples

- **Browse Dictionary**  
  Access `dictionairy_browse.xq` via the browser or REST endpoint to view dictionary entries.

- **Add New Entry**  
  Navigate to `add_entry.xq` to input a new word and its translations/definitions.

- **Edit Existing Entry**  
  Use `edit_entry.xq` with the target entry’s identifier to update its information.

- **Save Changes**  
  The `save_entry.xq` script will handle the submission of new or edited entries, validating and saving them to `dictionary.xml`.

---

## Troubleshooting Tips

- **HTTP 404 or Script Not Found**  
  Verify that the BaseX HTTP server is running and that the webapp scripts are correctly deployed in the server’s directory.

- **Permission Errors on Save**  
  Ensure BaseX has write permissions on the `dictionary.xml` file and the database directory.

- **Typo in Filenames**  
  Consider renaming `dictionairy_browse.xq` to `dictionary_browse.xq` for consistency and to avoid confusion.

- **Java or BaseX Version Issues**  
  Use Java 11+ and BaseX version 11.9 or newer for best compatibility.

- **RESTXQ Module Errors**  
  Confirm that `restxq.xqm` is correctly imported in other `.xq` scripts and that RESTXQ annotations are properly used.

---
