; extends
(call 
       function: (attribute
		   attribute: (identifier) @_name (#eq? @_name "execute") 
		   )
       arguments: (argument_list
		    (string 
		      	(string_start)
; Inject into .exectute(" ") as sql
			(string_content) @injection.content
			(string_end)
			(#set! injection.language "sql")
			)
		    )
)
