<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-default">
                    <div class="card-header"> {{title}}</div>
                          
                    <div class="card-body">
                           <rodape> </rodape>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</template>

<script>
    export default {
        props: ['title'],
    
        mounted() {
            
        }
    }
</script>
