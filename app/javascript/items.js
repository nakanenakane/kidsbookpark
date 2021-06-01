$(function(){
  // 子のselectタグを追加
  function build_childSelect() {
    let child_select = `<i class="fas fa-angle-down"></i>
                        <br>
                        <select name="item[category_id]" class="child_category_id">
                          <option value="">---</option>
                        </select>
                        `
    return child_select;
  }

  // selectタグにoptionタグを追加
  function build_Option(children) {
    let option_html = `<option value=${children.id}>${children.name}</option>`
    return option_html;
  }

  // 孫のselectタグを追加
  function build_gcSelect() {
    let gc_select = `<i class="fas fa-angle-down"></i>
                     <br>
                     <select name="item[category_id]" class="gc_category_id">
                       <option value="">---</option>
                     </select>`
    return gc_select;
  }

  $(".category_field").change(function () {
    // 選択した親の値を取得する
    let parentValue = $(".category_field").val(); 
     let form = $(this);
    //  form.nextAll(".gc_category_id").remove();
    // 初期値("---")以外を選択したらajaxを開始
    if (parentValue.length != 0) {
      $.ajax({
        url: '/items/search',
        type: 'GET',
        // itemsコントローラーにparamsをparent_idで送る
        data: { parent_id: parentValue },
        dataType: 'json'
      })
        .done(function (data) {
          let child_select = build_childSelect;

          // selectタグを生成してビューにappendする
          $(".category_field_c").empty().append(child_select);
          $(".category_field_gc").empty();
          // jbuilderから取得したデータを1件ずつoptionタグにappendする
          data.forEach(function (d) {
            let option_html = build_Option(d)
            $(".child_category_id").append(option_html);
          })
        })
        .fail(function () {
          alert("通信エラーです！");
        })
    }
  });
  $(".category_field_c").on("change", ".child_category_id", function () {
    // 選択した子の値を取得する
    let childValue = $(".child_category_id").val();
    // 初期値("---")以外を選択したらajaxを開始
    if (childValue.length != 0) {
      $.ajax({
        url: '/items/search',
        type: 'GET',
        // itemsコントローラーにparamsをchildren_idで送る
        data: { children_id: childValue },
        dataType: 'json'
      })
        .done(function (gc_data) {
          // selectタグを生成してビューにappendする
          let gc_select = build_gcSelect
          console.log(gc_select);
          $(".category_field_gc").empty().append(gc_select);
          // jbuilderから取得したデータを1件ずつoptionタグにappendする
          gc_data.forEach(function (gc_d) {
            let option_html = build_Option(gc_d);
            $(".gc_category_id").append(option_html);
          });
        })
        .fail(function () {
          console.log(gc_select);
          alert("gcで通信エラーです！");
        });
    }
  });
});