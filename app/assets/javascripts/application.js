// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require_tree .




// $(document).ready(function() { 
//   $( ".sample_select2" ).select2({
//     width: 400,
//     multiple: true
//    });
// });


window.onload = function(){
	const reviewButton = document.querySelector('.review-button');
	const reviewContent = document.querySelector('.review-content');
	reviewButton.addEventListener('click',() => {
	reviewContent.style.display = 'block';
	});
// }

// window.onload = function(){
	const totalReview = document.querySelector('.total-review');
	const totalReviewButton = document.querySelector('.total-review-button');
	const firstReview = document.querySelector('.first-review');

	totalReviewButton.addEventListener('click',(event) => {
		if (totalReview.style.display === 'none'){
			totalReview.style.display = 'block';
			firstReview.style.display = 'none';
			totalReviewButton.innerHTML = 'しまう';
		}else{
			totalReview.style.display = 'none';
			firstReview.style.display = 'block';
			totalReviewButton.innerHTML = 'もっと見る';
		}
	});
}


// 郵便番号を入力すると都道府県以下が自動で入力される //
$(window).ready(function() {
  $('delivery_postal_code_and_address').jpostal({
    postcode : [
      '#delivery_postal_code'
    ],
    address : {
      '#delivery_address' : '%3%4%5'
    }
  });
});

