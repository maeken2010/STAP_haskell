--2014/08/17
--STAP細胞を見つけます
--コンパイルして実行するとSTAPを探して，見つけたら終了します

import System.Random
main = do
  gen <- newStdGen
  let cell = take 4 (randomRs ('A','Z') gen) --大英字4桁をランダム生成
  putStrLn cell
  if cell == "STAP"
    then putStrLn "You find STAP Cell!"
    else main --mainを再帰
