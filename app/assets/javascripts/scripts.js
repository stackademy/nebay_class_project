console.log("running")

var main = function(){

	$('.bid-do').click(function(){
		$('.form-group').removeClass("has-error")
		if($('.bid-highest')[0]) {
			var bid_amount = $('.bid-amount')[0].value
			var bid_highest = $('.bid-highest').html()
			var bid_highest = parseInt(bid_highest)
			console.log(bid_amount)
			console.log(bid_highest)

			if(bid_amount <= bid_highest) {
				$('.form-group').addClass("has-error")
			
				console.log("bid too low")
			}
		}
		else {
			console.log("no bids yet")
		}
	})

}

$(document).ready(main)