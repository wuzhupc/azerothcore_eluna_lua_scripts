INSERT INTO quest_template_locale(id,locale,title,details,Objectives,CompletedText,ObjectiveText1,ObjectiveText2,ObjectiveText3,ObjectiveText4,VerifiedBuild) 
SELECT entry,'zhTW',Title_loc5,Details_loc5,Objectives_loc5,CompletedText_loc5,ObjectiveText1_loc5,ObjectiveText2_loc5,ObjectiveText3_loc5,ObjectiveText4_loc5, 0 from locales_quest where Title_loc5 is not null and Title_loc5!=''

INSERT INTO quest_request_items_locale (id,locale,CompletionText,VerifiedBuild) 
SELECT entry,'zhTW', RequestItemsText_loc5, 0 from locales_quest where RequestItemsText_loc5 is not null and RequestItemsText_loc5!=''


INSERT INTO quest_template_locale 
SELECT ID,'zhTW',title,Details,Objectives,EndText,CompletedText,ObjectiveText1,ObjectiveText2,ObjectiveText3,ObjectiveText4,0 from quest_template_locale_copy1 where locale='zhCN' and id not in (
SELECT id from quest_template_locale_copy1 WHERE locale='zhTW')

select count(1) from quest_template_locale ;
select count(1) from quest_template_locale_copy1 ;