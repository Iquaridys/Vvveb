@questions = [data-v-component-questions]
@question  = [data-v-component-questions] [data-v-question]

@question|deleteAllButFirstChild

@questions|prepend = <?php
if (isset($_questions_idx)) $_questions_idx++; else $_questions_idx = 0;
$previous_component = isset($current_component)?$current_component:null;
$component_questions = $current_component = $this->_component['questions'][$_questions_idx] ?? [];

$questions = $component_questions['product_question'] ?? [];
$_pagination_count = $questions['count'] ?? 0;
$_pagination_limit = isset($questions['limit']) ? $questions['limit'] : 5;	
?>

@question|before = <?php
$_default = (isset($vvveb_is_page_edit) && $vvveb_is_page_edit ) ? [0 => ['product_question_id' => 0, 'content' => '']] : false;
$questions = empty($questions) ? $_default : $questions;

if($questions && is_array($questions)) {
	foreach ($questions as $index => $question) {?>
		
		@question|data-question_id = $question['question_id']
		
		@question|addClass = <?php echo 'level-' . ($question['level'] ?? 0);?>
		
		@question|id = <?php echo 'question-' . $question['product_question_id'];?>
		
		@question [data-v-question-content] = <?php echo $question['content'];?>
		
		@question img[data-v-question-*]|src = $question['@@__data-v-question-(*)__@@']
		@question img[data-v-question-avatar]|width = <?php echo $question['size'] ?? '60';?>
		
		@question [data-v-question-*]|innerText = $question['@@__data-v-question-(*)__@@']
		
		@question a[data-v-question-*]|href = $question['@@__data-v-question-(*)__@@']
	
	@question|after = <?php 
	} 
}
?>