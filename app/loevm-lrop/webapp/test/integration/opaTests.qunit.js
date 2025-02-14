sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'loevm/nm/bookshop/loevmlrop/test/integration/FirstJourney',
		'loevm/nm/bookshop/loevmlrop/test/integration/pages/BooksList',
		'loevm/nm/bookshop/loevmlrop/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('loevm/nm/bookshop/loevmlrop') + '/index.html'
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