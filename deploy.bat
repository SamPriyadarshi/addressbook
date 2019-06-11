@echo off
echo %ART_ID% : %ART_URL% 
echo %REL_ART_ID% : %REL_ART_URL%

set REL_ART_ID=release-qa
SET REL_ART_URL=http://localhost:8081/repository/release-qa/

set REL_ART_ID=maven-releases
SET REL_ART_URL=http://localhost:8081/repository/maven-releases/

mvn deploy 