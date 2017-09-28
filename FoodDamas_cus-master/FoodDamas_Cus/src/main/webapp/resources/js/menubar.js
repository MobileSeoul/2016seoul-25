function menu() {
  //variabele link hamburger menu (icon)
  var $toggle = document.getElementById('menu_toggle');
  //variabele navigatie (volledige navigatie)
  var $sideMenu = document.getElementById('side-menu');
  //variabele kruisje (sluiten nav)
  var $close = document.getElementById('close');

  //klikken op hamburger icon
  $toggle.addEventListener('click', function(){
    //toggleClass van jquery ( verwijderd en voegt classes toe), toevoegen en verwijderen van sideMenuToggle bij klik op hamburger icon
    classie.toggle($sideMenu, "sideMenuToggle");

  });
  
  //klikken op kruisje
  $close.addEventListener('click', function(){
    //verwijderen van de klasse sideMenuToggle 
    classie.remove($sideMenu, "sideMenuToggle");
  });
}

//uitvoeren van de functie menu
menu();