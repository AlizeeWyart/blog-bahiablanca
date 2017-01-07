$('.edit-btn').on('click', function(){
  $('.edit-hidden').removeClass("hidden");
});

$('.froala-editor').froalaEditor({
    toolbarButtons: [
        'bold', 'italic', 'underline', 'paragraphFormat', 'formatOL',
        'formatUL', 'insertHTML', 'undo', 'redo', 'html'
    ]
});
