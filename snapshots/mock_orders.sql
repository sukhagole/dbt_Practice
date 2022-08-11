{ % snapshot mock_orders %} 
	
    {% set new_schema = target.schema _ '_snapshot' %}

	{{ 
		config(
			target_database ='analytics',				
			target_schema = 'new_schema',								// These target databse and schema are different from our default target values run for dbt projects. We want this to stay somewhere independently 
			unique_key ='order_id',
			
			strategy ='timestamp',												// we are using the timstamp to determine whether the time record has been add or changed. 
			updated_at ='updated_at',
			)
			
	}}
	
	select * from analytics.development.mock_orders;
	
	{% endsnapshot %}
	