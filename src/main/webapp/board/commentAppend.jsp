<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<?xml version="1.0" encoding="UTF-8"?>
<comment>
	<result></result>
	<item>
		<commentnum>${commentSeq }</commentnum>
		<boardnum>${boardSeq }</boardnum>
		<writer>${commentId }</writer>
		<content>${commentText }</content>
		<datetime>${commentDate }</datetime>
	</item>
</comment>