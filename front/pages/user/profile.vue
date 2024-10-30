<template>
  <PrimeCard>
    <template #title>
      <div class="card-title-size">
        {{ $t('user.profile').userInfo }}
      </div>
    </template>
    <template #content>
      <div class="row">
        <div class="col-md-6 mt-1" style="height: 15rem;">
          <PrimeCard class="h-100 cardProfile-1">
            <template #content>
                <div>
                  <div class="p-inputgroup">
                    <span class="p-inputgroup-addon">
                      <i class="pi pi-user"></i>
                    </span>
                    <InputText class="p-inputtext-sm" :placeholder="$t('user.profile').fullName" />
                  </div>
                </div>
                <div>
                  <div class="p-inputgroup">
                    <span class="p-inputgroup-addon">
                      <i class="fas fa-user-tag"></i>
                    </span>
                    <InputText class="p-inputtext-sm" :placeholder="$t('config.initial').dbName" />
                  </div>
                </div>
                <div>
                  <div class="p-inputgroup">
                    <span class="p-inputgroup-addon">
                      <i class="fas fa-at"></i>
                    </span>
                    <InputText class="p-inputtext-sm" :placeholder="$t('config.initial').serverName" />
                  </div>
                </div>
                <div>
                  <div class="p-inputgroup">
                    <span class="p-inputgroup-addon">
                      <i class="fas fa-mobile"></i>
                    </span>
                    <InputText class="p-inputtext-sm" :placeholder="$t('config.initial').firstElemenet" />
                  </div>
                </div>
              <!-- </div> -->
            </template>
          </PrimeCard>
          
        </div>
        <div class="col-md-6 mt-1" style="height:15rem">
          <ChangePassword class="h-100"/>
        </div>
      </div>
    </template>
  </PrimeCard>
</template>
<script>
import PrimeCard from 'primevue/card'
import InputText from 'primevue/inputtext'
import ChangePassword from '~/components/pages/security/users/ChangePassword.vue'


export default {
  components: {
    PrimeCard,
    InputText,
    ChangePassword,
  }
}
</script>

<style lang="scss">
.cardProfile-1 {
  .p-card {
    &-body, &-content, &-content > div  {
      height: 100%;
    }

    &-body {
      padding-left: 2rem;
      padding-right: 2rem;
    }

    &-content {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

  }
}

</style>
