// $(document).ready(function() {
//     $(".like-button").submit(function(e) {
//       e.preventDefault();
//       target = $(e.target)
//       $.ajax({
//         url: target.attr('action'),
//         method: 'post',
//         data: $(target).serialize()
//       })
//         .done(function(response){
//           $('.likes-count').html(response)
//         })
//     });

// });