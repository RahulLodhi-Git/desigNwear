# desigNwear

## Steps to setup the node js project

-[]

-[] Pending Task

1.  getSingleUserDetails api
2.  Update/changePassword api
3.  forgetPassword link api
4.  all user list api only for admin users
5.  Update user details api
6.  Update user image(avatar) api

For Orders Details Table

1. id
2. paymentId
3. total
4. created
5. updated
6. user.id
7. couponId

order Item Table

1. id
2. order.id
3. quantity
4. billing_address_id/object // need to create a address table
5. delivery_address_id/object // need to create a address table
6. created
7. updated
8. design_ID // need to create a table
9. size
10. cloth_material_id (cotton, nylon) // need to create a table
11. cloth_Style_Type_id (e.g overSize, regular, full,sweat,hood) // need to create a table
12. refundStatus
13. refundReason
14. replaceStatus
15. replaceReason
16. customer_feedback_Id // need to create a feedback table
17. price
18. delivery_details_id // create to create delivery record table

Payment Table

1. id
2. order.id
3. status
4. provider
5. amount
6. created
7. updated
8. couponId // need to create a coupon table
9. isAppliedAnyCoupon
10. coupon_value

Delivery Record Table

1. orderId
2. paymentMode
3. paymentStatus
4. expected_delivery_date
5. delivery_address
6. billing_address
7. user:user_id
8. contact_number
9. alternate_number

Address Table

1. full_name
2. contact_number
3. alternate_number
4. user_id
5. address_line
6. address_line_2
7. landmark
8. country id
9. state id
10. pinCode
11. location_coordinates
    12 email_notification

https://excalidraw.com/#json=5Y4pAlOuQVqujdUK-aOzO,pi4OtFbOJUbZAXEQkZmJcg
