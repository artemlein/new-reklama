<template>


    <table class="table table-hover">
        <thead>
        <tr>
            <th> Название канала </th>
            <th> Страница в VK </th>
            <th> Подписчики </th>
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
                        <li>
                            <form method="POST" action="#" >

                                <button type="submit" class="btn btn-outline btn-sm">
                                    <i class="fa fa-trash" aria-hidden="true"></i> Delete</button>
                            </form>
                        </li>
                        <li class="divider"> </li>
                        <li>
                            <a href="#" >
                                <i class="icon-bag"></i> Send to Buy</a>
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
            }
        },
        mounted() {

            this.items = JSON.parse(this.channels);

        },
        methods: {

            buy_channel: function(item){

                 axios({
                     method: 'get',
                     url: "/table/channels/buy",
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

        }

    }
</script>
