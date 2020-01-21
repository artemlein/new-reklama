<template>


    <table class="table table-hover">
        <thead>
        <tr>
            <th> Название канала </th>
            <th> Страница в VK </th>
            <th @click="sortedList(subscribe)"> Подписчики </th>
            <th> Описание </th>
            <th> Отдельный ролик </th>
            <th> Интеграция </th>
            <th> Status </th>
            <th>  </th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="item in items" >
            <td> <a v-bind:href="item.url_channel" target="_blank">{{item.name_channel}}</a> </td>
            <td> <a v-bind:href="item.url_vk" target="_blank">{{item.name_vk}}</a></td>
            <td> {{item.subscribe}}</td>
            <td> {{item.description}}</td>
            <td>
                <span class=""> {{item.price_video}} </span>
            </td>
            <td>
                <span class=""> {{item.price_int}} </span>
            </td>
            <td>
            <td>
                <span class="label label-sm label-danger"> Не куплен </span>
            </td>
            <td><div class="page-toolbar">
                <div class="btn-group pull-right">
                    <button type="button" class="btn green btn-sm btn-outline dropdown-toggle" data-toggle="dropdown"><i class="icon-wrench"></i>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li>
                            <a href="https://socialblade.com/search/{item->url_channel}" target="_blank">
                                <i class="fa fa-pie-chart" aria-hidden="true"></i> SocialBlade</a>
                        </li>
                        <li>
                            <a @click="buy_channel(item)">
                                <i class="fa fa-usd" aria-hidden="true"></i> Buy
                            </a>
                        </li>
                        <li class="divider"> </li>
                        <li>
                            <a :href="url_edit1 + item.id +  url_edit2" >
                                <i class="icon-wrench"></i>  Edit
                            </a>

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
            channels: String,
        },
        data: function () {
            return {
                items: "",
                url: "",
                url_edit1: "/reklama/table/channels/",
                url_edit2: "/edit",
            }
        },
        mounted() {

            this.items = JSON.parse(this.channels);

        },
        methods: {

            buy_channel: function(item){

                 axios({
                     method: 'get',
                     url: "/reklama/table/channels/buy",
                     params: {
                         id: item.id,
                         name_channel: item.name_channel,
                         url_channel: item.url_channel,
                         url_vk: item.url_vk,
                         name_vk: item.name_vk,
                         note: "none",
                     }
                 }).then((response) => {
                     console.log(response);
                 })


            },
            sortedList () {
                switch(this.sortParam){
                    case 'subscribe': return this.items.sort(sortByPrice);
                    default: return this.items;
                }
            }

        }

    }
</script>
