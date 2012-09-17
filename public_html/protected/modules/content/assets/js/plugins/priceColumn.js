(function($)
{
    $.widget('CmsUI.priceColumn', $.CmsUI.gridBase, {
        _version:0.1,

        // default options
        options:{
            isFull:false,
            saveUrl:'/main/helpAdmin/saveAttribute',
            editableElements:'.price, .discount_price'
        },

        full:null,
        collapse:null,

        parent:function()
        {
            return $.CmsUI.gridBase.prototype;
        },
        _create:function()
        {
            this.parent()._create.call(this);
        },
        _initHandlers:function()
        {
            this.parent()._initHandlers.call(this);

            var self = this;
            self._initEditable();
            self._initCheckboxes();
        },
        _initEditable:function()
        {
            var self = this;
            self.full = $('.full', self.element);
            self.collapse = $('.collapse', self.element);

            (!!self.options.isFull ? self.collapse : self.full).hide();

            //full edit
            self.full.find(self.options.editableElements).click(function()
            {
                $(this).editable(self.options.saveUrl, $.extend(self.defaultJeditable, {
                    submitdata:self._getSubmitDataForEditable(this)
                }));
            });

            //collapse edit
            self.collapse.find(self.options.editableElements).click(function()
            {
                var all = {data:new Array, bulk_update:true},
                    elements = self._getAppropriateFullElements(this);

                $(this).editable(function(value, settings)
                {
                    elements.each(function()
                    {
                        $(this).text(value);
                        all.data.push(self._getSubmitDataForEditable(this, value));
                    });

                    //save all
                    $.post(self.options.saveUrl, all);
                    return value;
                }, self.defaultJeditable);
            });
        },
        _getAppropriateFullElements:function(item)
        {
            var attr = $(item).attr('class');
            return $(item).closest('.collapse').siblings('.full').find('.' + attr);
        },
        _getSubmitDataForEditable:function(element, value)
        {
            var o = {
                attribute:$(element).attr('class'),
                attributes:{
                    current_column:$(element).parent().data('current_column')
                },
                id:$(element).parent().data('id'),
                model:'ProductVariant'
            };
            if (value != undefined)
            {
                o.value = value;
            }
            return o;
        },
        _initCheckboxes:function()
        {
            var self = this,
                f = self.element.find('.full');

            $('.checkbox_h input', f).click(function()
            {
                var depend = $(this).closest('td').find('.prices > .checkbox > input');
                if (this.checked)
                {
                    $(this).attr('checked', 'checked');
                    depend.each(function()
                    {
                        this.checked = true;
                        $(this).attr('checked', 'checked');
                    });
                }
                else
                {
                    $(this).removeAttr('checked');
                    depend.each(function()
                    {
                        this.checked = false;
                        $(this).removeAttr('checked');
                    });
                }
            });
        },
        showFull:function()
        {
            this.options.isFull = true;
            this.element.find('.collapse').hide().end().find('.full').show();
        },
        showCollapse:function()
        {
            this.options.isFull = false;
            this.element.find('.full').hide().end().find('.collapse').show();
        },
        saveAll:function()
        {
            var self = this;
            blockUI();
            var all = {data:new Array, bulk_update:true},
                f = self.options.isFull ? $('.full', self.element) : $;
            //            if ()
            //            {
            $(self.options.editableElements, f).each(function()
            {
                all.data.push(self._getSubmitDataForEditable(this, $(this).text()));
            });
            //            }
            $.post(self.options.saveUrl, all, function()
            {
                unblockUI();
            });
        },
        getData:function()
        {
            if (self.options.isFull)
            {
                return $('.prices > .checkbox > input:checked', self.full).parent().parent();
            }
            else
            {
                return $('.prices', self.full);
            }
//            elements.each(function()
//            {
//                var item = $(this);
//                data[item.data('id')] = {
//                    price:item.find('.price').text(),
//                    discount_price:item.find('.discount_price').text()
//                };
//            });
        },
//        setData:function(data)
//        {
//            var self = this;
//            $.map(data, function(o, i)
//            {
//                var elem = $('[data-id=' + i + ']', self.full);
//                $.map(o, function(val, attr)
//                {
//                    $('.' + attr, elem).text(val);
//                });
//            });
//        }
    });
})(jQuery);


