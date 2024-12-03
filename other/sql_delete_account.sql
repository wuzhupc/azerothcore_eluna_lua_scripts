
DELETE from mail where `receiver` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));

DELETE from mail_items where `receiver` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));

DELETE from item_instance where `owner_guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));


DELETE from character_pet where `owner` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));

DELETE from character_queststatus where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));
DELETE from character_queststatus_rewarded where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));
DELETE from character_reputation where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));
DELETE from character_skills where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));
DELETE from character_spell where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));
DELETE from character_talent where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));
DELETE from character_achievement where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));
DELETE from character_achievement_progress where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));
DELETE from character_action where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));
DELETE from character_aura where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));
DELETE from character_glyphs where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));
DELETE from character_homebind where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));
DELETE from character_inventory where `guid` in (
select guid from characters where account not in 
(SELECT id from acore_auth.account));

select guid from characters where account not in 
(SELECT id from acore_auth.account);

DELETE from characters where account not in 
(SELECT id from acore_auth.account);

