<template>
    <div class="w-100">
        <div class="d-flex justify-content-between align-items-center">
            <div class="inputGroup pr-2" style="width:50%">
                <label for="name" class="inputGroup__label w-100">
                   Nombre 
                </label>
                <InputText id="name" placeholder="Nombre" v-model="user.nombres" class="p-inputtext-sm inputGroup__input w-100">
                </InputText>
            </div>

            <div class="inputGroup" style="width:50%">
                <label for="surname" class="inputGroup__label w-100">
                   Apellido
                </label>
                <InputText id="surname" placeholder="Apellido" v-model="user.apellidos" class="p-inputtext-sm inputGroup__input w-100">
                </InputText>
            </div>

        </div>
        
        <div class="mt-4 d-flex justify-content-between align-items-center">
            <div class="inputGroup pr-2" style="width:50%">
                <label for="typeDocument" class="inputGroup__label w-100">
                    Tipo de documento 
                </label>
                <Dropdown id="typeDocument" v-model="user.tipoDocumento" :options="listTypesDocument" optionLabel="descripcion" placeholder="Select type" class="w-100"/>
            </div>
            
            <div class="inputGroup" style="width:50%">
                <label for="document" class="inputGroup__label w-100">
                    Documento
                </label>
                <InputText id="document" placeholder="Documento" v-model="user.dni" class="p-inputtext-sm inputGroup__input w-100">
                </InputText>
            </div>

        </div>

        <div class="mt-4 d-flex justify-content-between align-items-center">
            <div class="inputGroup pr-2" style="width: 40%;">
                <label for="zipCode" class="inputGroup__label w-100">
                    Código Postal
                </label>
                <InputMask v-model="user.codigoPostal" mask="99999" class="w-100"/>
            </div>
            <div class="inputGroup pr-2" style="width: 60%;">
                <label for="phone" class="inputGroup__label w-100">
                    Teléfono
                </label>
                <InputMask v-model="user.celular" mask="999 999 999" class="w-100"/>
            </div>
        </div>

        <div class="mt-4 d-flex align-items-center">
            <div class="inputGroup pr-2" style="width: 50%;">
                <label for="address" class="inputGroup__label w-100">
                    Correo electrónico
                </label>
                <InputText id="email" placeholder="Correo electrónico" v-model="user.email" type="email" class="p-inputtext-sm inputGroup__input w-100">
                </InputText>
            </div>
            
            <div class="inputGroup" style="width: 50%;">
                <label for="birthdate" class="inputGroup__label w-100">
                    Fecha de nacimiento
                </label>
                <Calendar id="birthdate" v-model="user.fechaNacimiento" dateFormat="dd/mm/yy" class="w-100"/>
            </div>
        </div>

        <div class="mt-4 d-flex align-items-center">
            <div class="inputGroup" style="width: 100%;">
                <label for="address" class="inputGroup__label w-100">
                   Dirección
                </label>
                <InputText id="address" placeholder="Dirección" v-model="user.direccion" class="p-inputtext-sm inputGroup__input w-100">
                </InputText>
            </div>
        </div>

        <div class="mt-4 d-flex justify-content-between align-items-center">
            <div class="inputGroup pr-2" style="width:33.3%">
                <label for="department" class="inputGroup__label">
                    Departamento
                </label>
                <Dropdown v-model="user.department" optionLabel="name" class="w-100" :options="listDepartments" @change="searchProvinces($event)"/>
            </div>
            <div class="inputGroup pr-2" style="width:33.3%">
                <label for="province" class="inputGroup__label">
                    Provincia
                </label>
                <Dropdown v-model="user.province" optionLabel="name" class="w-100" :options="listProvinces" @change="searchDistricts($event)"/>
            </div>
            <div class="inputGroup" style="width:33.3%">
                <label for="district" class="inputGroup__label">
                    Distrito
                </label>
                <Dropdown v-model="user.district" optionLabel="name" class="w-100" :options="listDistricts"/>
            </div>
        </div>

        

        <div class="mt-4 d-flex align-items-center">
            <div class="inputGroup pr-2" style="width: 50%;">
                <label for="password" class="inputGroup__label w-100">
                    Contraseña
                </label>
                <Password placeholder="Contraseña" id="passwordId" class="p-inputtext-sm group__input w-100 registerPassword"  v-model="user.contrasena" toggleMask  :feedback="false"/>
            </div>

            <div class="inputGroup" style="width: 50%;">
                <label for="password" class="inputGroup__label w-100">
                    Confirmar Contraseña
                </label>
                <Password placeholder="Confirmar Contraseña" id="passwordId2" class="p-inputtext-sm group__input w-100 registerPassword"  v-model="confirmPassword" toggleMask  :feedback="false"/>
            </div>    
        </div>


        <div class="text-center mt-3 w-100">
            <PrimeButton label="Registrar" class="p-button-sm mt-3 button-registrar" type="submit" @click="saveForm()"/>
        </div>
        
    </div>
</template>

<script>
import InputText from 'primevue/inputtext'
import Dropdown from 'primevue/dropdown'
import Calendar from 'primevue/Calendar'
import InputMask from 'primevue/inputmask'
import Password from 'primevue/password'
import PrimeButton from 'primevue/button'
// import SaveCancelButton from '~/components/shared/buttons/SaveCancel.vue'

export default {
    name: "SignUpForm",
    props: {
        objUser: {type:Object, default: null}
    },
    components: {
        // SaveCancelButton,
        InputText,
        Dropdown,
        Calendar,
        InputMask,
        Password,
        PrimeButton
    },
    data(){
        return {
            confirmPassword: "",
            user: {
                idUsuario: null,
                nombres: "",
                apellidos: "",
                dni: "",
                fechaNacimiento: new Date(),
                idTipoDocumento: 0,
                tipoDocumento: {
                    idTipoDocumento: 1,
                    descripcion: "DNI"
                },
                email: "",
                direccion: "",
                idDepartamento: 0,
                idProvincia: 0,
                idDistrito: 0,
                codigoPostal: "",
                contrasena: "",
                celular: "",
                idTipoUsuario: 1,
                tipoUsuario: {
                    idTipoUsuario: 1,
                    descripcion: "Cliente"
                },
                activo: true,


                // typeDocument: 0,
                // birthDate: new Date(),
                department: null,
                province: null,
                district: null,
                userType: null,
            },
            listProvinces: [],
            listDepartments: [],
            listTypesDocument: [],
            listDistricts: [],
            listUserTypes: [],
            idDepartamento: null,
        }
    },
    beforeMount(){
        const content = document.getElementsByTagName("HTML")[0]
        content.classList.add("theme")
    },
    mounted() {
        this.searchDepartments()
        this.searchTypeDocument()
        this.searchTypeUsers()
        console.log(this.objUser)
        if(this.objUser != null){
            this.user = this.objUser
            this.user.fechaNacimiento = this.user.fechaNacimiento.replace("-", "/")
            this.user.fechaNacimiento = new Date(this.user.fechaNacimiento)
        }
    },
    methods: {
        searchTypeDocument() {
            this.$axios.$get(`api/tipoDocumento/`)
            .then((response) => {
                this.listTypesDocument = response
            })
            .catch(()=>{
                this.$makeToast('error', 'error')
            })
        },
        searchTypeUsers() {
            this.$axios.$get(`api/tipoUsuario/`)
            .then((response) => {
                this.listUserTypes = response
            })
            .catch(()=>{
                this.$makeToast('error', 'error')
            })
        },
        // Cargar provincias, distritos, tipos de documentos
        searchDepartments() {
            this.$axios.$get(`api/departamentos/`)
            .then((response) => {
                const departaments = response
                this.listDepartments = departaments.map(departamento => ({
                    id: Number(departamento.id), // Convertir a número
                    name: departamento.name
                }))

                if (Object.keys(this.objUser).length > 0) {
                    const id = this.listDepartments.find(departaments => departaments.id === this.objUser.idDepartamento.replace(/^0+/, ''))
                    console.log(id)
                }
            })
            .catch(()=>{
                this.$makeToast('error', 'error')
            })
        },
        searchProvinces(event) {
            const departamento = event.value
            this.idDepartamento = departamento.id
            this.$axios.$get(`api/provincias/${departamento.id}`)
            .then((response) => {
                const provincias = response
                this.listProvinces = provincias.map(provincia => ({
                    id: Number(provincia.id), // Convertir a número
                    name: provincia.name
                }))
                
            })
            .catch(()=>{
                this.$makeToast('error', 'error')
            })
        },
        searchDistricts(event) {
            const province = event.value

            this.$axios.$get(`api/distritos/${this.idDepartamento}/${province.id}`)
            .then((response) => {
                const distritos = response
                this.listDistricts = distritos.map(distrito => ({
                    id: Number(distrito.id), // Convertir a número
                    name: distrito.name
                }))
            })
            .catch(()=>{
                this.$makeToast('error', 'error')
            })
        },
        saveForm() {
            this.user.idDepartamento = this.user.department.id
            this.user.idProvincia = this.user.province.id
            this.user.idDistrito = this.user.district.id
            this.user.idTipoDocumento = this.user.tipoDocumento.idTipoDocumento
            this.user.idTipoUsuario = 1
            this.user.fechaNacimiento = this.$date.convertStringToFormat(this.user.fechaNacimiento.toString(), "YYYY-MM-DD")

            delete this.user.department
            delete this.user.province
            delete this.user.district
            delete this.user.tipoDocumento
            delete this.user.userType
            delete this.user.tipoUsuario
            // delete this.user.birthDate

            if(this.user.idUsuario == null) {
                this.$axios.$post('api/usuarios/registroDeUsuario', this.user )
                .then(response => {
                    console.log(response)
                    this.$closeModal('modal-signup-form')
                }).catch(()=>{
                    this.$makeToast("error", this.$t("app").error)
                })
                .finally(()=>{
                    console.log("Usuario registrado")
                })
            } else {
                this.$axios.$put(`api/usuarios/actualizacionDeUsuario/${this.user.dni}`, this.user)
                .then(response => {
                    console.log(response)
                    this.$closeModal('modal-editar')
                }).catch(()=>{
                    this.$makeToast("error", this.$t("app").error)
                })
                .finally(()=>{
                    console.log("Usuario registrado")
                })
            }
        },
    }
}
</script>

<style lang="scss">
.inputGroup {
    &__label {
        font-size: 0.8rem !important;
        margin-bottom: 0.2rem !important;
    }
}

#modal-signup-form{
    .modal-header {
        background: #fb292a !important;
    }
    
    .modal-title,.close {
        color: #fff !important;
    }
}

.registerPassword .p-password-input {
    width: 100% !important;
}

.button-registrar {
    background-color: #fb292a;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
</style>