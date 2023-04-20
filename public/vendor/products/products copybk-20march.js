$(document).ready(function ($) {


    $("#product_type").on('change', function (event) {
        var product_type = $("#product_type").val();
        if (product_type == '1') {
            $(".variation").css("display", "block");
            $(".general").css("display", "none");
            $("#pills-home").removeClass('active');
            $("#pills-home-tab").removeClass('active');
            $("#pills-home").removeClass('show');
            $("#pills-profile").addClass('active');
            $("#pills-profile-tab").addClass('active');
            $("#pills-profile").addClass('show');
            $(".removeActive").removeClass('active show');

        }
        if (product_type == '0') {
            $(".variation").css("display", "none");
            $(".general").css("display", "block");
            $("#pills-home").addClass('active');
            $("#pills-home").addClass('show');
            $("#pills-home-tab").addClass('active');
            $("#pills-profile").removeClass('active');
            $("#pills-profile").removeClass('show');
            $("#pills-profile-tab").removeClass('active');
            $(".removeActive").removeClass('active show');
        }
    });

    var product_type = $("#product_type").val();
    if (product_type == '1') {
        $(".variation").css("display", "block");
        $(".general").css("display", "none");
        $("#pills-home").removeClass('active');
        $("#pills-home-tab").removeClass('active');
        $("#pills-home").removeClass('show');
        $("#pills-profile").addClass('active');
        $("#pills-profile-tab").addClass('active');
        $("#pills-profile").addClass('show');
        $(".removeActive").removeClass('active show');
    }
    if (product_type == '0') {
        $(".variation").css("display", "none");
        $(".general").css("display", "block");
        $("#pills-home").addClass('active');
        $("#pills-home-tab").addClass('active');
        $("#pills-home").addClass('show');
        $("#pills-profile").removeClass('active');
        $("#pills-profile-tab").removeClass('active');
        $("#pills-profile").removeClass('show');
        $(".removeActive").removeClass('active show');
    }

    $(".addAttribute").on('click', function (event) {
        event.preventDefault();
        var attribute = $("#attribute").val();
        alert(attribute)
        if ($.isNumeric(attribute)) {
            $("select option[value='" + attribute + "']").attr('disabled', true);
            $.ajax({
                type: "GET",
                url: '/get_attribute_terms/' + attribute + '',
                success: function (response) {
                    console.log(response);
                    html = $('#terms').html();
                    html += '<hr id="' + response["attribute_id"] + '" style="height:2px;border-width:0;color:gray;background-color:gray">'
                    html += '<div class="row mt-2" id=' + response["attribute_id"] + '>'
                    html += '<div class="col-md-8 att_terms"><h5>' + response["attribute_name"] + ':</h5><div class="row"><div class="col-md-6">'
                    html += '<select class="form-control attribute_terms ' + response["attribute_name"] + '" id="' + response["attribute_id"] + '">';
                    $.each(response["attribute_terms"], function (key, value) {
                        html += '<option  value="' + key + '">' + value + '</option>'
                    });
                    html += '</select></div><div class="col-md-6"><button value="' + response["attribute_name"] + '" id="' + response["attribute_id"] + '" class="btn btn-sm btn-link remove_attribute" style="color:red;">remove</button></div></div><div class="mt-3 ' + response["attribute_id"] + '">Values :</div></div><div class="col-md-4"></div><button class="btn btn-primary addTerm mt-1" id="' + response["attribute_id"] + '">Add</button></div>'
                    $('#terms').html(html);
                },
            });
        }
    });
    $("#terms").on('click', '.addTerm', function (event) {
        event.preventDefault();
        var attribute_id = this.id;
        var term_name = $("#terms").find("#" + attribute_id + ".attribute_terms :selected").text();
        var term_id = $("#terms").find("#" + attribute_id + ".attribute_terms :selected").val();
        if ($.isNumeric(term_id)) {
            if ($("select.attribute_terms option[value='" + term_id + "']").is(':disabled')) {
                console.log('Option with value ' + term_id + ' is disabled');
            } else {
                console.log('Option with value ' + term_id + ' is not disabled');
                var html = $("div ." + attribute_id + "").html();
                html += '<button  class="btn removeTerm" id="' + term_id + '"><span class="badge badge-light" ><input name="attribute_terms[]" type="hidden" class="' + attribute_id + ' all_attribute_terms" id="' + term_id + '" value="' + term_id + '">' + term_name + '</span>x</button >'
                $("div ." + attribute_id + "").html(html);
                $("select.attribute_terms option[value='" + term_id + "']").attr('disabled', true);
            }
        }
        updateVAriations();
    });
    $("#terms").on('click', '.remove_attribute', function (event) {
        event.preventDefault();
        var confirmResult = confirm('Are you sure you want to remove the attribute ? These will also remove product variations if any. ');
        if (confirmResult) {
            var value = $(this).val();
            var id = this.id;
            var option = $('.' + value + ' option').map((index, option) => option.value);
            $.each(option, function (key, variant_id) {
                $('#make_variations option[value="' + variant_id + '"]').remove();
            });
            $("div #" + value + "").remove();
            $("hr #" + value + "").remove();
            $('select option[value="' + id + '"]').prop("disabled", false);
            var input = $("." + id + "").val('');
        }
    });

    $("#terms").on('click', '.removeTerm', function (event) {
        event.preventDefault();
        var confirmResult = confirm('Are you sure you want to remove the term ? These will also remove product variation.');
        if (confirmResult) {
            var id = this.id;
            $(this).remove();
            $(this).val('');
            var variant_div = $(this).text().slice(0, -1);
            $('.' + variant_div).remove();
            $("#" + variant_div).remove();
            $('select option[value="' + id + '"]').prop("disabled", false);
            $('#make_variations option[value="' + id + '"]').remove();
        }
    });

    function updateVAriations() {
        $('#noAttError').html('');
        var inputs = $(".all_attribute_terms");
        var values = [];
        $.each(inputs, function (key, value) {
            var val = $(value).val();
            values.push(val);
        });

        var removeValue = [];
        var option = $('#make_variations option').map((index, option) => option.value);
        $.each(option, function (key, value) {
            if (value == '') {
                return
            } else {
                removeValue.push(value);
            }
        });

        var diff = $(values).not(removeValue).get();

        var input = [];
        $.each(diff, function (key, input_value) {
            input.push(input_value);
        });

        if (input.length != 0) {

            var form_data = {
                input: input,
            }

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                type: "POST",
                url: '/ajax_get_seleted_variations',
                data: form_data,
                success: function (response) {
                    if (response != 'empty') {
                        var html = '';
                        $.each(response, function (key, value) {
                            html += '<option value="' + key + '">' + value + '</option>'
                        });
                        $('#make_variations').append(html);
                    } else {
                        html = $('#make_variations').html('');
                        $('#noAttError').html('Please first add attributes from Attributes tab');
                    }
                },
            });

        }
    }

    $(".addVariant").on('click', function (event) {
        event.preventDefault();
        var value = $('#make_variations').val();
        alert(value);

        if ($.isNumeric(value)) {
            var text = $("#make_variations").find(":selected").text();
            html = '<hr class="mt-2" id="' + text + '" style="height:2px;border-width:0;color:gray;background-color:gray">';
            html += '<div class="' + text + ' mt-3 container" >';
            html += '<header class="bg-light">';
            html += '<h6 class="font-weight-bold">&nbsp; &nbsp; &nbsp; ' + text + '</h6>';
            html += '<div class="row">' +
                '<div class="col-md-10">' +
                '<input type="hidden" name="v_name[]" value="' + text + '"></input>' +
                '<button  class="variantBtn btn btn-link" id="' + value + '" data-toggle="collapse" data-target="#demo' + value + '">Add/Edit details.</button>' +
                '</div>' +
                '<div class="col-md-2">' +
                '<button style="color:red;" id="' + text + '-' + value + '" class="removeVariantBtn btn btn-sm btn-link">remove</button>' +
                '</div>' +
                '</div>';
            html += '</header>';
            html += '<div id="demo' + value + '" class="collapse">' +
                '<div class="row">' +
                '<div class="col">' +
                '<label class="mt-3" for="variation_price">Regular Price</label>' +
                '<input  class="form-control  " type="text" name="variation_price[]" id="variation_price" placeholder="Regular Price">' +
                '</div>' +
                '<div class="col">' +
                '<label class="mt-3 " for="variation_sale_price">Sale Price</label>' +
                '<span><a href="#" id="v_schedule-' + value + '">  &nbsp; Schedule</a></span>' +
                '<span><a href="#" id="v_cancel-' + value + '" style="display:none">  &nbsp; Cancel Schedule</a></span>' +
                '<input  class="form-control  " type="text" name="variation_sale_price[]" id="variation_sale_price" placeholder="Sale Price">' +
                '</div>' +
                '</div>' +
                '<div class="row" id="v_sale_dates-' + value + '" style="display: none">' +
                '<div class="col">' +
                '<label class="mt-3 " for="v_start_date">Sale Start Date</label>' +
                '<input  class="form-control" type="date" name="v_start_date[]" id="start_date"></div>' +
                '<div class="col">' +
                '<label class="mt-3 " for="end_date">Sale End Date</label>' +
                '<input  class="form-control" type="date" name="v_end_date[]" id="end_date"></div>' +
                '</div>' +
                '<div class="row">' +
                '<div class="col">' +
                '<label class="mt-3" for="variation_stock">Stock</label>' +
                '<input  class="form-control  " type="text" name="variation_stock[]" id="variation_stock" placeholder="Stock">' +
                '</div>' +
                '<div class="col">' +
                '<label class="mt-3" for="variation_allow_backorders">Allow backorders?</label>' +
                '<select class="form-control" name="variation_allow_backorders[]" id="variation_allow_backorders">' +
                '<option value="1">Yes</option>' +
                '<option value="0">No</option>' +
                '</select>' +
                '</div>' +
                '</div>' +
                '<div class="row mt-3">' +
                '<label for="variation_dimensions">Dimensions</label>' +
                '<div class="col">' +
                '<input  class="form-control" type="text" name="variation_length[]" id="variation_length" placeholder="Length">' +
                '</div>' +
                '<div class="col">' +
                '<input  class="form-control  " type="text" name="variation_width[]" id="variation_width" placeholder="Width">' +
                '</div>' +
                '<div class="col">' +
                '<input  class="form-control  " type="text" name="variation_height[]" id="variation_height" placeholder="Height">' +
                '</div>' +
                '</div>' +
                '<div class="row">' +
                '<div class="col">' +
                '<label class="mt-3 " for="variation_weight">Weight</label>' +
                '<input  class="form-control" type="text" name="variation_weight[]" id="variation_weight" placeholder="Weight">' +
                '</div>' +
                '<div class="col">' +
                '<label class="mt-3 " for="variation_sku">SKU</label>' +
                '<input  class="form-control  " type="text" name="variation_sku[]" id="variation_sku" placeholder="Sku">' +
                '</div>' +
                '</div>' +
                '<div class="row">' +
                '<div class="col">' +
                '<label class="mt-3 " for="variation_image">Image</label>' +
                '<input  class="form-control" type="file" name="variation_image[]" multiple id="variation_image" placeholder="Image">' +
                '</div>' +
                '</div>' +
                '<div class="row">' +
                '<div class="col">' +
                '<label class="mt-3 " for="variation_description">Description</label>' +
                '<textarea class="form-control mt-2" name="variation_description[]" id="" cols="30" rows="3" placeholder="Enter Product Description here...."></textarea>' +
                '</div>' +
                '</div>' +

                '</div>';
            html += '</div>';
            // html = $('#variants').html(html);
            $("#variants").append(html);
            $('select option[value="' + value + '"]').prop("disabled", true);
        } else {
            $('#noAttError').html('Please first add attributes from Attributes tab');
        }

    });



    $("#variants").on('click', '.removeVariantBtn', function (event) {
        event.preventDefault();
        var confirmResult = confirm('Are you sure you want to remove the variation ?');
        if (confirmResult) {
            var id = this.id;
            var arr = id.split('-');
            $('.' + arr[0]).remove();
            $("#" + arr[0]).remove();
            $('#make_variations option[value="' + arr[1] + '"]').prop("disabled", false);
        }

    });

    $('#schedule').click(function () {
        $('#schedule').toggle('hide');
        $('#cancel').toggle('show');
        $('#sale_dates').toggle('show');

    });

    $('#cancel').click(function () {
        $('#schedule').toggle('show');
        $('#cancel').toggle('hide');
        $('#sale_dates').toggle('hide');
    });

    $("#variants").on('click', 'a', function (event) {
        id = this.id;
        var arr = id.split('-');
        $('#v_schedule-' + arr[1]).toggle('hide');
        $('#v_cancel-' + arr[1]).toggle('show');
        $('#v_sale_dates-' + arr[1]).toggle('show');

    });
    $("#variants").on('click', '#v_cancel', function (event) {
        id = this.id;
        var arr = id.split('-');
        $('#v_schedule-' + arr[1]).toggle('show');
        $('#v_cancel-' + arr[1]).toggle('hide');
        $('#v_sale_dates' + arr[1]).toggle('hide');
    });

    $("#variants").on('click', '.variantBtn', function (event) {
        event.preventDefault();
        var id = this.id;
    });


    $('#publish').click(function (event) {

        $("input[name*='variation_price']").each(function () {
            if (!$.isNumeric($(this).val())) {
                event.preventDefault();
                $(this).addClass("highlight");
                $('#variation_price_error').show().fadeOut(5000);;
                $('#validation_errors').show().fadeOut(5000);;
                $('#variation_price_error').html("Invalid input for variation price");
                $(this).on('focus', function () {
                    $(this).removeClass('highlight');
                });
            }
        });
        $("input[name*='variation_stock']").each(function () {
            if (!$.isNumeric($(this).val())) {
                event.preventDefault();
                $(this).addClass("highlight");
                $('#variation_stock_error').show().fadeOut(5000);;
                $('#validation_errors').show().fadeOut(5000);;
                $('#variation_stock_error').html("Invalid input for variation stock");
                $(this).on('focus', function () {
                    $(this).removeClass('highlight');
                });
            }
        });
        $("input[name*='variation_sale_price']").each(function () {
            if ($(this).val() != "") {
                if (!$.isNumeric($(this).val())) {
                    event.preventDefault();
                    $(this).addClass("highlight");
                    $('#variation_sale_price_error').show().fadeOut(5000);;
                    $('#validation_errors').show().fadeOut(5000);;
                    $('#variation_sale_price_error').html("Invalid input for variation sale price");
                    $(this).on('focus', function () {
                        $(this).removeClass('highlight');
                    });
                }
            }
        });
        $("input[name*='variation_length']").each(function () {
            if ($(this).val() != "") {
                if (!$.isNumeric($(this).val())) {
                    event.preventDefault();
                    $(this).addClass("highlight");
                    $('#variation_length_error').show().fadeOut(5000);;
                    $('#validation_errors').show().fadeOut(5000);;
                    $('#variation_length_error').html("Invalid input for variation length");
                    $(this).on('focus', function () {
                        $(this).removeClass('highlight');
                    });
                }
            }
        });
        $("input[name*='variation_width']").each(function () {
            if ($(this).val() != "") {
                if (!$.isNumeric($(this).val())) {
                    event.preventDefault();
                    $(this).addClass("highlight");
                    $('#variation_width_error').show().fadeOut(5000);;
                    $('#validation_errors').show().fadeOut(5000);;
                    $('#variation_width_error').html("Invalid input for variation width");
                    $(this).on('focus', function () {
                        $(this).removeClass('highlight');
                    });
                }
            }
        });
        $("input[name*='variation_height']").each(function () {
            if ($(this).val() != "") {
                if (!$.isNumeric($(this).val())) {
                    event.preventDefault();
                    $(this).addClass("highlight");
                    $('#variation_height_error').show().fadeOut(5000);;
                    $('#validation_errors').show().fadeOut(5000);;
                    $('#variation_height_error').html("Invalid input for variation height");
                    $(this).on('focus', function () {
                        $(this).removeClass('highlight');
                    });
                }
            }
        });
        $("input[name*='variation_weight']").each(function () {
            if ($(this).val() != "") {
                if (!$.isNumeric($(this).val())) {
                    event.preventDefault();
                    $(this).addClass("highlight");
                    $('#variation_weight_error').show().fadeOut(5000);;
                    $('#validation_errors').show().fadeOut(5000);;
                    $('#variation_weight_error').html("Invalid input for variation weight");
                    $(this).on('focus', function () {
                        $(this).removeClass('highlight');
                    });
                }
            }
        });

        $("input[name*='variation_sku']").each(function () {
            if ($(this).val() != "") {
                var variation_id = $('#variation_id').val();
                var form_data = {
                    input: $(this).val(),
                    variation_id: variation_id,
                }

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $.ajax({
                    type: "POST",
                    url: '/ajax_check_duplicate_sku_for_variation',
                    data: form_data,
                    async: false,
                    success: function (response) {
                        if (response == 'false') {
                            event.preventDefault();
                            $(this).addClass("highlight");
                            $('#variation_sku_error').show().fadeOut(5000);
                            $('#validation_errors').show().fadeOut(5000);
                            $('#variation_sku_error').html("Vartiaion Sku with same name exists");
                            $(this).on('focus', function () {
                                $(this).removeClass('highlight');
                            });
                        }
                    },
                });
            }
        });
        var product_type = $("#product_type").val();
        var price = $('#price').val();
        var sale_price = $('#sale_price').val();
        var name = $('#name').val();
        var weight = $('#weight').val();
        var height = $('#height').val();
        var length = $('#length').val();
        var width = $('#width').val();
        var stock = $('#stock').val();
        if (product_type == '0') {


            if (!$.isNumeric(price)) {
                event.preventDefault();
                $('#price').addClass("highlight");
                $('#price_error').show().fadeOut(5000);;
                $('#validation_errors').show().fadeOut(5000);
                $('#price_error').html("Invalid input for product price");
                $('#price').on('focus', function () {
                    $(this).removeClass('highlight');
                });
            }

            if (sale_price != "") {
                if (!$.isNumeric(sale_price)) {
                    event.preventDefault();
                    $('#sale_price').addClass("highlight");
                    $('#sale_price_error').show().fadeOut(5000);;
                    $('#validation_errors').show().fadeOut(5000);
                    $('#sale_price_error').html("Invalid input for product sale price");
                    $('#sale_price').on('focus', function () {
                        $(this).removeClass('highlight');
                    });
                }
            }
        }


        if (!$.isNumeric(stock)) {
            event.preventDefault();
            $('#stock').addClass("highlight");
            $('#stock_error').show().fadeOut(5000);;
            $('#validation_errors').show().fadeOut(5000);
            $('#stock_error').html("Invalid input for product stock");
            $('#stock').on('focus', function () {
                $(this).removeClass('highlight');
            });

        }

        if (name == "") {
            event.preventDefault();
            $('#name').addClass("highlight");
            $('#name_error').show().fadeOut(5000);;
            $('#validation_errors').show().fadeOut(5000);
            $('#name_error').html("Invalid input for product name");
            $('#name').on('focus', function () {
                $(this).removeClass('highlight');
            });

        }


        if (weight != "") {
            if (!$.isNumeric(weight)) {
                event.preventDefault();
                $('#weight').addClass("highlight");
                $('#weight_error').show().fadeOut(5000);;
                $('#validation_errors').show().fadeOut(5000);
                $('#weight_error').html("Invalid input for product weight");
                $('#weight').on('focus', function () {
                    $(this).removeClass('highlight');
                });
            }
        }

        if (height != "") {
            if (!$.isNumeric(height)) {
                event.preventDefault();
                $('#height').addClass("highlight");
                $('#height_error').show().fadeOut(5000);;
                $('#validation_errors').show().fadeOut(5000);
                $('#height_error').html("Invalid input for product height");
                $('#height').on('focus', function () {
                    $(this).removeClass('highlight');
                });
            }
        }

        if (length != "") {
            if (!$.isNumeric(length)) {
                event.preventDefault();
                $('#length').addClass("highlight");
                $('#length_error').show().fadeOut(5000);;
                $('#validation_errors').show().fadeOut(5000);
                $('#length_error').html("Invalid input for product length");
                $('#length').on('focus', function () {
                    $(this).removeClass('highlight');
                });
            }
        }

        if (width != "") {
            if (!$.isNumeric(width)) {
                event.preventDefault();
                $('#width').addClass("highlight");
                $('#width_error').show().fadeOut(5000);;
                $('#validation_errors').show().fadeOut(5000);
                $('#width_error').html("Invalid input for product width");
                $('#width').on('focus', function () {
                    $(this).removeClass('highlight');
                });
            }
        }
        if ($('#sku').val() != "") {
            var product_id = $('#product_id').val();
            var form_data = {
                input: $('#sku').val(),
                product_id: product_id,
            }

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                type: "POST",
                url: '/ajax_check_duplicate_sku_for_product',
                data: form_data,
                async: false,
                success: function (response) {
                    if (response == 'false') {
                        event.preventDefault();
                        $(this).addClass("highlight");
                        $('#sku_error').show().fadeOut(5000);;
                        $('#validation_errors').show().fadeOut(5000);;
                        $('#sku_error').html("Sku with same name exists");
                        $(this).on('focus', function () {
                            $(this).removeClass('highlight');
                        });
                    }
                },
            });


        }
    });

    // function checkProductSku(data){

    //     var returnVal = '';

    //     return returnVal;
    // }










});
