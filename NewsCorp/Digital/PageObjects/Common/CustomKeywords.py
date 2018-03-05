def check_if_return_type_is_list( x ):
    if type(x) is list:
        print 'This is a list'
        return True
    else:
        return False


def check_if_item_is_in_list( item , list ):
    if item in list:
        return True
    else:
        return False

