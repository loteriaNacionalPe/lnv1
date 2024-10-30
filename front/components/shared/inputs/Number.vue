<template>
  <div class="inputNumber">
    <button class="inputNumber__modifier inputNumber__modifier-left" @click="decrement">-</button>
    <input class="inputNumber__input" v-model="internalValue" :disabled="disabled" @change="emitOnChange" />
    <button class="inputNumber__modifier inputNumber__modifier-right" @click="increment">+</button>
  </div>
</template>

<script>
export default {
  name: "InputNumber",
  props: {
    value: {
      type: Number,
    },
    min: {
      type: Number,
      default: -Infinity,
    },
    max: {
      type: Number,
      default: Infinity,
    },
    step: {
      type: Number,
      default: 1,
    },
    disabled: {
      type: Boolean,
      default: false,
    },
  },
  computed: {
    internalValue: {
      get() {
        return this.value
      },
      set(newValue) {
        let parsedValue = parseInt(newValue)
        if (isNaN(parsedValue)) {
          this.$emit("input", this.value)
        } else {
          let clampedValue = Math.max(this.min, Math.min(parsedValue, this.max))
          this.$emit("input", clampedValue)
        }
      },
    },
  },
  methods: {
    increment() {
      if (this.value + this.step <= this.max) {
        this.$emit("input", this.value + this.step)
      }
      this.emitOnChange()
    },
    decrement() {
      if (this.value - this.step >= this.min) {
        this.$emit("input", this.value - this.step)
      }
      this.emitOnChange()
    },
    emitOnChange(){
      this.$emit('onChange')
    }
  },
}
</script>

<style lang="scss">
.inputNumber {
  position: relative;
  display: inline-block;
  width: 100%;
  
  &__input {
    width: 100%;
    height: 2rem;
    font-size: 0.8rem;
    text-align: center;
    border: 2px solid #ccc;
    border-radius: 5px;
    outline: none;
  }

  &__modifier {
    position: absolute;
    top: 0;
    font-size: 1.2rem;
    font-weight: bold;
    cursor: pointer;
    border: none;
    background-color: transparent;
    
    &-left {
      left: 10px;
    }
    
    &-right {
      right: 10px;
    }
  }
}




// table {
//   .input-container {
//     .input-modifier {
//       visibility: hidden;
//     }
//     .input-number {
//       border-color: transparent;
//       background-color: transparent;
//     }
//     &:hover {
//       .input-number {
//         border-color: #ccc;
//         background-color: #fff;
//       }
//       .input-modifier {
//         visibility: visible;
//       }
//     }
//   }
// }
</style>
