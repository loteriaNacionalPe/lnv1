<template>
  <div v-show="loading" class="page-loader page-loader-variant-1">
    <div class="loader-content">
      <a class="brand brand-md"><img src="/img/load/logo-animation.gif" alt="" width="150" /></a>
      <div class="page-loader-body">
        <div id="spinningSquaresG">
          <div class="spinningSquaresG" id="spinningSquaresG_1"></div>
          <div class="spinningSquaresG" id="spinningSquaresG_2"></div>
          <div class="spinningSquaresG" id="spinningSquaresG_3"></div>
          <div class="spinningSquaresG" id="spinningSquaresG_4"></div>
          <div class="spinningSquaresG" id="spinningSquaresG_5"></div>
          <div class="spinningSquaresG" id="spinningSquaresG_6"></div>
          <div class="spinningSquaresG" id="spinningSquaresG_7"></div>
          <div class="spinningSquaresG" id="spinningSquaresG_8"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    loading: true,
  }),
  methods: {
    start() {
      this.loading = true
    },
    finish() {
      this.loading = false
    },
  },
}
</script>

<style lang="scss" scoped>
/* css preload */
.brand{
  background-color: rgba(0, 0, 0, 0);
  border-bottom: 0px;
}
.page-loader-variant-1 {
  position: fixed;
  left: 0;
  top: 0;
  bottom: 0;
  right: 0;
  float: left;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 25px;
  z-index: 9999999;
  background: rgba(0, 0, 0, 0.5);
  transition: 0.3s all ease;

  .page-loader-body {
    margin-top: 15px;
    text-align: center;
  }
}

#spinningSquaresG {
  position: relative;
  width: 150px;
  height: 18px;
  margin: auto;
}

.spinningSquaresG {
  position: absolute;
  top: 0;
  background-color: #00559c;
  width: 18px;
  height: 18px;
  animation-name: bounce_spinningSquaresG;
  animation-duration: 1.5s;
  animation-iteration-count: infinite;
  animation-direction: normal;
  transform: scale(0.3);
}

#spinningSquaresG_1 {
  left: 0;
  animation-delay: 0.6s;
}

#spinningSquaresG_2 {
  left: 19px;
  animation-delay: 0.75s;
}

#spinningSquaresG_3 {
  left: 37px;
  animation-delay: 0.9s;
}

#spinningSquaresG_4 {
  left: 56px;
  animation-delay: 1.05s;
}

#spinningSquaresG_5 {
  left: 75px;
  animation-delay: 1.2s;
}

#spinningSquaresG_6 {
  left: 94px;
  animation-delay: 1.35s;
}

#spinningSquaresG_7 {
  left: 112px;
  animation-delay: 1.5s;
}

#spinningSquaresG_8 {
  left: 131px;
  animation-delay: 1.64s;
}

@keyframes bounce_spinningSquaresG {
  0% {
    transform: scale(1);
    background-color: #fff;
  }
  100% {
    transform: scale(0.3) rotate(90deg);
    background-color: #00559c;
  }
}

[data-x-mode="true"] .page-loader-variant-1 {
  opacity: 0;
  visibility: hidden;
  z-index: -1;
}
</style>
