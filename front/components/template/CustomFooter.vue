<template>
    <!-- Footer -->
    <footer class="sticky-footer bg-footer w-100">
      <div class="copyright ml-2">
        <span>
          Copyright &copy; Loteria Nacional {{ year }}
        </span>
      </div>
    </footer>
    <!-- End of Footer -->
</template>

<script>
  export default {
    name: "CustomFooter",
    date() {
      return {
        year: "",
      }
    },
    beforeMount() {
      this.year = new Date().getFullYear()
    },
  }
  </script>
  
  <style>
  .bg-footer{
    background: #e9ecef99;
  }
  </style>
  