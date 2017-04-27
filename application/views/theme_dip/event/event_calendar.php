<div id="message-box">
	<div id="result-msg-box" class="hidden" ></div>
</div>


<section id="projects">
	<div class="container mt15 pan">
		
		<div id="calendar">

		</div>

	</div>
</section>

<script type="text/javascript">
	$(document).ready(function($){

		var sid = Math.floor(Math.random()*10000000000);

		$('#calendar').fullCalendar({
		    header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			timeFormat: { // for event elements
				'default': 'H:mm'
			},
			eventLimit: true, // allow "more" link when too many events
			eventSources: [

	        // your event source
	        {
	            url: '<?=site_url("event/calendar/ajax-load-calendar-feed")?>' + '/' + sid,
	            type: 'POST',
	            data: {
	                custom_param1: 'something',
	                custom_param2: 'somethingelse'
	            },
	            error: function() {
	                alert('there was an error while fetching events!');
	            },
	            color: 'yellow',   // a non-ajax option
	            textColor: 'black' // a non-ajax option
	        }

	        // any other sources...

	    	]
		});

		/*
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			defaultDate: '2014-09-12',
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2014-09-01'
				},
				{
					title: 'Long Event',
					start: '2014-09-07',
					end: '2014-09-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2014-09-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2014-09-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2014-09-11',
					end: '2014-09-13'
				},
				{
					title: 'Meeting',
					start: '2014-09-12T10:30:00',
					end: '2014-09-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2014-09-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2014-09-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2014-09-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2014-09-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2014-09-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2014-09-28'
				}
			]
		});
		*/


		<?=@$message?>
		<?=@$js_code?>

	});
</script>