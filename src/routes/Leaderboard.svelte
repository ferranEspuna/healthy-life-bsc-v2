<script lang="ts">

  export let name: string;
  export let players: { name: string; strike: number; id: number }[];
  import { scale, slide, fade } from "svelte/transition";
  import { flip } from "svelte/animate";
  $: max_strike = Math.max(...players.map((p) => p.strike));
  $: max_id = Math.max(...players.map((p) => p.id));
  let players0 = JSON.parse(JSON.stringify(players));
  function insert() {
    players.push({ name: "sdfas", strike: max_strike + 3, id: max_id + 1 });
    players = players;
  }
  function reset() {
    players = JSON.parse(JSON.stringify(players0));
  }
  function increment(player: { name: string; strike: number; id: number }) {
    player.strike += 1;
    players = players;
    console.log(player);
  }
  function sort() {
    players = players.sort((a, b) => b.strike - a.strike);
  }
</script>

<main>
  <div class="leaderboard-container">
    <h2 class="leaderboard-title">{name}</h2>
    <div>
      {#each players as player (player.id)}
        <div animate:flip transition:slide class="player">
          <p class="name">{player.name}</p>
          <div class="strike_container">
            <!-- svelte-ignore a11y-click-events-have-key-events -->
            <div
              class="strike"
              style="width: {(100 * player.strike) / max_strike}%;"
              on:click={() => increment(player)}
            >
              {#key player.strike}
              <p class="strike_number" in:fade>{player.strike}</p>
              {/key}
            </div>
          </div>
        </div>
      {/each}
    </div>
    <button on:click={sort}>sort</button>
    <button on:click={reset}>reset</button>
    <button on:click={insert}>insert</button>
  </div>
</main>

<style>

  .leaderboard-container {
    background-color: lightblue;
    border-radius: 1em;
    padding: 1em;
    margin-bottom: 1em;
    transition: height 0.5s ease-in-out;
  }

  .leaderboard-title {
    color: darkslategrey;
  }

  .player {
    display: flex;
    align-items: center;
    margin-bottom: 0.1em;
  }

  .name {
    width: 10%;
    min-width: 8ch;
    padding-left: 0.5em;
    text-align: left;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  .strike_container {
    padding-left: 0.5em;
    padding-right: 0.5em;
    width: 90%;
    display: flex;
    align-items: center;
  }

  .strike {
    height: 3em;
    border-radius: 0.5em;
    background-color: blue;
    transition: width 0.5s ease-in-out;
  }

  .strike_number {
    color: white;
    text-align: right;
    padding-right: 0.5em;
  }
</style>
