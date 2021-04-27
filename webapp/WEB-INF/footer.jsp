    <script>
            $(document).ready(function(){
            console.log($(".create_post"))
            $(".create_post").click(function(e){
                e.preventDefault();
                $(".modal").css("display","block")
            })

            $(".modal-inner").click(function(e){
                if(e.currentTarget == e.target){
                    $(".modal").css("display","none")
                }
            })
            $("#image").change(function () {
                readURL(this);
            });
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        //alert(e.target.result);
                        $(".img_container").css("display","block");
                        $('.img_container img').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }
        });

    </script>
</body>
</html>