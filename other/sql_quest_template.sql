--修改任务物品需求
update quest_template set  RequiredItemCount1 = ROUND(RequiredItemCount1/2) where RequiredItemCount1>=2;
update quest_template set  RequiredItemCount2 = ROUND(RequiredItemCount2/2) where RequiredItemCount2>=2;
update quest_template set  RequiredItemCount3 = ROUND(RequiredItemCount3/2) where RequiredItemCount3>=2;
update quest_template set  RequiredItemCount4 = ROUND(RequiredItemCount4/2) where RequiredItemCount4>=2;
update quest_template set  RequiredItemCount5 = ROUND(RequiredItemCount5/2) where RequiredItemCount5>=2;
update quest_template set  RequiredItemCount6 = ROUND(RequiredItemCount6/2) where RequiredItemCount6>=2;

update quest_template set  RequiredNpcOrGoCount1 = ROUND(RequiredNpcOrGoCount1/2) where RequiredNpcOrGoCount1>=2;

update quest_template set  RequiredNpcOrGoCount2 = ROUND(RequiredNpcOrGoCount2/2) where RequiredNpcOrGoCount2>=2;
update quest_template set  RequiredNpcOrGoCount3 = ROUND(RequiredNpcOrGoCount3/2) where RequiredNpcOrGoCount3>=2;
update quest_template set  RequiredNpcOrGoCount4 = ROUND(RequiredNpcOrGoCount4/2) where RequiredNpcOrGoCount4>=2;