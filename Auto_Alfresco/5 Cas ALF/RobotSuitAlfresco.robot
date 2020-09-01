*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${Browswe}   http://localhost:7070/share/page/context/mine/myfiles
${URL}       gc 
*** Keywords ***
LoginKey
     Input Text        name=username    6156613
     Input Password    name=password    alfresco
     Click button      xpath=//button[contains(text(),'Connexion')]
Connection
     Open Browser      ${Browswe}    gc
     Maximize Browser Window
     Set Browser Implicit Wait    2s    
*** Test Cases ***
CT1 Creation dossier 
     Connection
     LoginKey
     Wait Until Element Is Visible     id=HEADER_MY_FILES   10
     Click Element     id=HEADER_MY_FILES
     Wait Until Element Is Visible     id=template_x002e_documentlist_v2_x002e_myfiles_x0023_default-createContent-button-button   10
     Click Element     id=template_x002e_documentlist_v2_x002e_myfiles_x0023_default-createContent-button-button
     Wait Until Element Is Visible     xpath=//span[contains(@class,'folder-file')]    10
     Click Element     xpath=//span[contains(@class,'folder-file')]
     Wait Until Element Is Visible     id=template_x002e_documentlist_v2_x002e_myfiles_x0023_default-createFolder-dialogTitle   10
     Input Text        xpath=//input[contains(@name,'prop_cm_name')]    DCT1
     Input Text        name=prop_cm_title   DCT1
     Input Text        name=prop_cm_description   Creer un dossier
     Click button      xpath=//button[contains(text(),'Enregistrer')]
     Sleep  2
     Close Browser
CT2 Suppression dossier  
     Connection
     LoginKey
     Wait Until Element Is Visible  id=HEADER_SEARCHBOX_FORM_FIELD   10
     Click Element     id=HEADER_SEARCHBOX_FORM_FIELD
     Input Text        id=HEADER_SEARCHBOX_FORM_FIELD    DCT1
     Press Keys        id=HEADER_SEARCHBOX_FORM_FIELD    ENTER
     Wait Until Element Is Visible   id=FCTSRCH_SEARCH_RESULT_ACTIONS   10
     Click Element     id=FCTSRCH_SEARCH_RESULT_ACTIONS
     Wait Until Element Is Visible   id=FCTSRCH_SEARCH_RESULT_ACTIONS_document-delete_text   10
     Click Element     id=FCTSRCH_SEARCH_RESULT_ACTIONS_document-delete_text
     Wait Until Element Is Visible   id=ALF_DELETE_CONTENT_DIALOG_title   10
     Click Element     id=ALF_DELETE_CONTENT_DIALOG_CONFIRMATION_label
     Sleep  2
     Close Browser
CT3 Creation groupe
     Connection
     LoginKey
     Wait Until Element Is Visible  id=HEADER_ADMIN_CONSOLE   10
     Click Element     id=HEADER_ADMIN_CONSOLE
     Wait Until Element Is Visible  xpath=//a[contains(text(),'Groupes')]   10
     Click Element     xpath=//a[contains(text(),'Groupes')]
     Wait Until Element Is Visible  id=page_x002e_ctool_x002e_admin-console_x0023_default-browse-button-button   10
     Click Element     id=page_x002e_ctool_x002e_admin-console_x0023_default-browse-button-button
     Wait Until Element Is Visible  xpath=//span[contains(@class,'groups-newgroup-button')]
     Click Element     xpath=//span[contains(@class,'groups-newgroup-button')]
     Input Text        id=page_x002e_ctool_x002e_admin-console_x0023_default-create-shortname     GRPCT3
     Input Text        id=page_x002e_ctool_x002e_admin-console_x0023_default-create-displayname   GRPCT3
     Click Element     id=page_x002e_ctool_x002e_admin-console_x0023_default-creategroup-ok-button-button
     Sleep  2
     Close Browser
CT4 Suppression groupe
     Connection
     LoginKey
     Wait Until Element Is Visible  id=HEADER_ADMIN_CONSOLE   10
     Click Element     id=HEADER_ADMIN_CONSOLE
     Wait Until Element Is Visible  xpath=//a[contains(text(),'Groupes')]   10
     Click Element     xpath=//a[contains(text(),'Groupes')]
     Input Text        id=page_x002e_ctool_x002e_admin-console_x0023_default-search-text   GRPCT3
     Click Element     id=page_x002e_ctool_x002e_admin-console_x0023_default-search-button-button
     Wait Until Element Is Visible  xpath=//a[contains(@class,'delete')]   10
     Click Element     xpath=//a[contains(@class,'delete')]
     Wait Until Element Is Visible   id=page_x002e_ctool_x002e_admin-console_x0023_default-deletegroupdialog_h   10
     Click Element     id=page_x002e_ctool_x002e_admin-console_x0023_default-remove-button-button
     Sleep  2 
     Close Browser
CT5 Suppression Site
     Connection
     LoginKey
     Wait Until Element Is Visible  id=HEADER_SITES_MENU_text  10
     Click Element     id=HEADER_SITES_MENU_text
     Wait Until Element Is Visible  id=HEADER_SITES_MENU_CREATE_SITE_text
     Click Element     id=HEADER_SITES_MENU_CREATE_SITE_text
     Wait Until Element Is Visible  id=CREATE_SITE_DIALOG_title   10
     Input Text        xpath=//input[contains(@name,'title')]   CT100site
     Wait Until Element Is Visible  id=CREATE_SITE_DIALOG_OK_label
     Sleep  15
     Click Element     id=CREATE_SITE_DIALOG_OK_label
     Wait Until Element Is Not Visible  id=CREATE_SITE_DIALOG_title   60
     Wait Until Element Is Visible  xpath=//a[contains(text(),'Accueil')]   25
     Click Element     xpath=//a[contains(text(),'Accueil')]
     Wait Until Element Is Visible  id=HEADER_SITES_MENU_text  10
     Click Element     id=HEADER_SITES_MENU_text
     Wait Until Element Is Visible  xpath=//a[contains(text(),'Recherche de sites')]
     Click Element     xpath=//a[contains(text(),'Recherche de sites')]
     Wait Until Element Is Visible  id=template_x002e_site-finder_x002e_site-finder_x0023_default-term   10
     Input Text        id=template_x002e_site-finder_x002e_site-finder_x0023_default-term   CT100site
     Wait Until Element Is Visible   xpath=//button[contains(text(),'Rechercher')]
     Sleep  5
     Click button     xpath=//button[contains(text(),'Rechercher')]
     Wait Until Element Is Visible   xpath=//button[contains(text(),'Supprimer')]   10
     Click button      xpath=//button[contains(text(),'Supprimer')]
     Wait Until Element Is Visible   id=prompt_h   10
     Click button      xpath=//span[contains(@class,'yui-button yui-push-button alf-primary-button')]//button[contains(text(),'Supprimer')]
     Wait Until Element Is Visible   id=prompt_h   10
     Click Element      xpath=//button[contains(text(),'Oui')]
     Sleep  3
     Close Browser


  