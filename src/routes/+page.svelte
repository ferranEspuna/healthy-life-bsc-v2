<script>
	import Leaderboard from './Leaderboard.svelte';
	let leaderboards = [
		{
			name: 'Work from office',
			id: 0,
			players: [
				{
					name: 'Ferraaaaaaaaaaaaaaaaaaaaaafsasdfasdfsdaan',
					strike: 10,
					id: 0
				},
				{ name: 'Joan', strike: 9, id: 1 },
				{ name: 'Seve', strike: 11, id: 2 },
				{ name: 'Irene', strike: 12, id: 3 },
				{ name: 'Aitor', strike: 0, id: 4 },
				{ name: 'Javi', strike: 3, id: 5 },
				{ name: 'Adrián', strike: 2, id: 6 }
			]
		},

		{
			name: 'No croissant',
			id: 1,
			players: [
				{ name: 'Ferran', strike: 10, id: 0 },
				{ name: 'Joan', strike: 0, id: 1 },
				{ name: 'Jorge', strike: 14, id: 7 }
			]
		}
	];

	// Import the functions you need from the SDKs you need
	import { initializeApp } from 'firebase/app';
	// TODO: Add SDKs for Firebase products that you want to use
	// https://firebase.google.com/docs/web/setup#available-libraries
	// Your web app's Firebase configuration
	// For Firebase JS SDK v7.20.0 and later, measurementId is optional

	const firebaseConfig = {
		apiKey: 'AIzaSyC8ZpGoEGaNvR-bfLsyh3Tkb0TTvPrsEYA',
		authDomain: 'fitlifebsc.firebaseapp.com',
		projectId: 'fitlifebsc',
		storageBucket: 'fitlifebsc.appspot.com',
		messagingSenderId: '1082594713680',
		appId: '1:1082594713680:web:35e7c9fb52dac177e5b155',
		measurementId: 'G-30RJGYCN81'
	};

	// Initialize Firebase

	const app = initializeApp(firebaseConfig);
	console.log(app);
</script>

<main>
	<h1>FitLifeBSC</h1>
	{#each leaderboards as leaderboard (leaderboard.id)}
		<Leaderboard {...leaderboard} />
	{/each}
</main>

<style>
	* {
		font: 1em sans-serif;
	}

	main {
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
	}

	h1 {
		color: blue;
		font-size: 4em;
	}

	@media (min-width: 0px) {
		main {
			max-width: none;
		}
	}
</style>
