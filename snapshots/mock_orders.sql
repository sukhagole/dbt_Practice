{ % snapshot mock_orders %} 

    {% set analytics.new_schema = analytics.target.schema + '_snapshot' %}

	{{ 
		config(
			target_database ='analytics',				
			target_schema = 'analytics.new_schema',							
			unique_key ='order_id',

			strategy ='timestamp',												
			updated_at ='updated_at',
			)

	}}

	select * from analytics.development.mock_orders

	{% endsnapshot %}