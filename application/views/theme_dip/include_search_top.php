<form id="frm_search" name="frm_search" class="navbar-form navbar-right searchbar mt25" role="search" id="hiddenSearchBox" action="" method="get">
    <div class="input-group">
        <div class="input-group-btn">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">All <span class="caret"></span></button>
            <!--                        <ul class="dropdown-menu">-->
            <!--                            <li><a href="#">Action</a></li>-->
            <!--                            <li><a href="#">Another action</a></li>-->
            <!--                            <li><a href="#">Something else here</a></li>-->
            <!--                            <li role="separator" class="divider"></li>-->
            <!--                            <li><a href="#">Separated link</a></li>-->
            <!--                        </ul>-->
            <select class="dropdown-menu" id="search_in_product_main" name="search_in_product_main">
                <option value="all">All</option>
                <?php if(is_var_array($master_product_main)){ ?>
                    <?php foreach($master_product_main as $item){ ?>
                        <option value="<?=get_array_value($item,"aid","N/A");?>"><?=get_array_value($item,"name","N/A");?></option>
                    <?php } ?>
                <?php } ?>
            </select>

        </div><!-- /btn-group -->
        <input type="search" class="form-control" placeholder="Search..">
        <div class="input-group-btn">
            <button type="submit" class="btn btn-default" data-toggle="searchbar"
                    data-target="#hiddenSearchBox" onclick="search_advance(1)">
                <span class="glyphicon glyphicon-search"></span> <span class="sr-only">Submit</span>
            </button>
        </div>

    </div>
</form>