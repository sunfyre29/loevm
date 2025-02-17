sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'nm/loevm/bookshoplrop/test/integration/FirstJourney',
		'nm/loevm/bookshoplrop/test/integration/pages/BooksList',
		'nm/loevm/bookshoplrop/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('nm/loevm/bookshoplrop') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBooksList: BooksList,
					onTheBooksObjectPage: BooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);