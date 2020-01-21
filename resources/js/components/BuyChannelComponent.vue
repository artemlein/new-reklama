<template>


    <table class="table table-hover">
        <thead>
        <tr>
            <th> #</th>
            <th> Name Channel</th>
            <th @click="clickConsole()"> Name Vk</th>
            <th @click="changeStatus()">Статус</th>
            <th></th>
            <th>Заметки</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="item in filtredChannels" v-bind:class="{danger: item.delete}
                                                ">

            <td>{{ item.id }}</td>
            <td><A v-bind:href="item.url_channel" target="_blank">{{ item.name_channel }}</A></td>
            <td><A v-bind:href="item.url_vk" target="_blank">{{ item.name_vk }}</A></td>
            <td>
                <span v-if="item.status === 1" class="label label-sm label-danger"> Отписать </span>
                <span v-if="item.status === 2" class="label label-sm label-info"> Ожидание </span>
                <span v-if="item.status === 3" class="label label-sm label-success"> Ролик выпущен </span>
            </td>
            <td>
                <input type="text" class="buy-note" placeholder="Заметка"  v-model="item.note"></input>
                <a @click="save_note(item)"  class="btn green btn-sm btn-outline icon-check p-1 pl-2 pr-2"></a>
            </td>
            <td>
                <div class="page-toolbar">
                    <div class="btn-group pull-right">
                        <button type="button" class="btn green btn-sm btn-outline dropdown-toggle" data-toggle="dropdown"><i class="icon-wrench"></i>
                        </button>
                        <ul class="dropdown-menu pull-right" role="menu">
                            <li>
                                <a @click="status(item.id,1),item.status = 1" target="_blank">
                                    <i class="fa icon-tag" aria-hidden="true"></i> Отписать
                                </a>
                            </li>
                            <li>
                                <a @click="status(item.id,2), item.status = 2">
                                    <i class="fa fa-usd" aria-hidden="true"></i> Ожидание публикации
                                </a>
                            </li>
                            <li>
                                <a href="#" @click="status(item.id,3), item.status = 3">
                                    <i class="icon-bag"></i> Ролик готов</a>
                            </li>
                            <li class="divider"> </li>
                            <li>
                                <form method="POST" action="#">
                                    <input type="hidden" name="_token" :value="csrf">

                                        <i @click="destory(item.id,item.delete = true)" class="fa fa-trash" aria-hidden="true"></i> Delete</button>
                                </form>
                            </li>

                        </ul>
                    </div>
                </div>
            </td>


        </tr>

        </tbody>
    </table>
</template>

<script>




    export default {

        props: {
            channels_raw: Array,

        },

        data: function () {

            return {
                csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                notes: "",
                items: "",
                channels: "",
                sortParam: "",

            }
        },
        mounted() {
            this.items = JSON.parse(this.channels);



        },
        computed:{
            filtredChannels: function(){
                function sortByPrice (d1,d2) {return (d1.status > d2.status) ? 1 : -1; }
                function sortById (d1,d2) {return (d2.id > d1.id) ? 1 : -1; }

                switch(this.sortParam){
                    case 'status': return this.channels_raw.sort(sortByPrice);
                    default: return this.channels_raw.sort(sortById);
                }

            }
        },
        methods: {
            changeStatus: function (){
                if(this.sortParam === 'status'){
                    this.sortParam = '';
                } else {
                    this.sortParam = "status";
                };
            },
            clickConsole: function(){
              console.log(this.sortParam);
            },

            destory: function(id){

                axios({
                    method: 'post',
                    url: "/reklama/table/buy-channels/" + id,
                    params: {
                        _method: 'delete',
                        _token: this.csrf,
                        id: id,
                    }
                }).then((response) => {
                    console.log(response);
                })
            },
            status: function(itemId,status){
                axios({
                    method: 'get',
                    url: "/reklama/table/buy-channels/change-status",
                    params: {
                        id: itemId,
                        status: status,
                    }
                }).then((response) => {
                    console.log(response);
                })
            },
            save_note: function(item){
                axios({
                    method: 'get',
                    url: "/reklama/table/buy-channels/note-save",
                    params: {
                        id: item.id,
                        note: item.note,
                    }
                }).then((response) => {
                    console.log(response);
                })
            },
        }

    }

</script>
