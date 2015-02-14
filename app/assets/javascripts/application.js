//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets
//=require groups
//=require_self
//scale div width
$(document).ready(function () {

  
  var windowSize = $(window).width();
  var totalWidth = 0;
  var i=0;
  $("#headerLog li").each(function() {
        totalWidth += $(this).width();
        i++;
    });
  
    
    var margin = (windowSize - 120 - totalWidth) / (i-2);
    margin = parseInt(margin);
    
    j=0;
   $("#headerLog li").each(function() {
    j++;
    if (j<i-1){
        $(this).attr('style', 'margin-right:' + margin + 'px' );
      }
    });
   var size=parseInt(windowSize/4);
   var size_ot=parseInt(windowSize-35-size);
    $("#tree_menu").width(size);
   $("#main_log").width(size_ot);
   
  var childSubgroups=document.getElementsByClassName("groups_child");
  var child_id;
   for(i=0; i<childSubgroups.length; i++) {
    child_id="#"+childSubgroups[i].id;
    $(child_id).hide();
   }
  
   $("#headerLog li")[i-2].attr('style', 'margin-right: 25px' );
   $("#headerLog li")[i-1].attr('style', 'margin-right: 0px' ); 


  
});

function show_form_group(par) {
  var id="#form_new_subgroup"+par;
 
  if (par=="group") $("#form_new_group").css('display','block');
  else $(id).css('display','block');
};


function show_form_edit_group(id) {
  id=id.toString();
  var id_input, id_submit, id_link, id_edit, id_delete;
  id_input="#"+id;
  
   
  if(id.indexOf("subgroup")==0) {

  id1=id.replace('subgroup','');
  
  id_submit="#submitSubgroup"+id1;
  id_link="#parentSubgroup"+id1;
  id_edit="#editSubgroup"+id1;
  id_delete="#deleteSubgroup"+id1;
  }

  else {
  id_submit="#submit"+id;
  id_link="#link"+id;
  id_edit="#edit"+id;
  id_delete="#delete"+id;
  }


  $(id_submit).css('display','block');
  $(id_input).css('display','block');
  $(id_input).prop('disabled',false);
  $(id_link).hide();
  $(id_edit).css('display','none');
  $(id_delete).css('display','none');
 
};


function hideChild(id) {


  if(id.indexOf("parentSubgroup")==0) {
  var id1=id.replace("parentSubgroup",'');
  var child="#subgroup1_"+id1;
  var img="#imgSubgroup"+id1;
 
}
else if (id.indexOf("parentClient")==0 ) {
  var id1=id.replace("parentClient",'');
  var child="#clients"+id1;
  var img="#imgClient"+id1;

}
else if (id.indexOf("linkSubgroup")==0) {
  var id1=id.replace("linkSubgroup",'');
  var child="#clientsSubgroup"+id1;
  var img="#imgClientSubgroup"+id1;

}
else {
  var id1=id.replace("parent",'');
  var child="#subgroup"+id1;
  var img="#img"+id1;

}

 $(child).toggle();
 if($(img).attr('src')=="/assets/collapse.jpg") $(img).attr('src',"/assets/expand.jpg");
 else $(img).attr('src',"/assets/collapse.jpg");

};

function show_form_notes() {
  $("#new_note").show();
  $("#link_new_note").hide();
}