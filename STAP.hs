--2014/08/27
--STAP細胞を見つけます
--コンパイルして実行するとSTAPを探して，見つけたら終了します

import System.Random
import Control.Monad

--教えてもらいながら作ったバージョン．
--無限リストを用いて，リストの長さが試行回数．
main = do
  gen <- newStdGen
  let cell = takeWhile (\x -> x/="STAP") $ cells (randomRs ('A','Z') gen) --STAPが見つかるまでのリスト
  print $ cell
  let n = length cell --長さが試行回数
  putStrLn $ "You found STAP Cell to " ++ show n ++ "th !"

cells :: String -> [String] --無限リストを生成する関数
cells cell = (take 4 cell) : cells (drop 4 cell)


---- 最初に思いついたやつ．これでは回数を数えられない．
---- main再帰
--main = do
--  gen <- newStdGen
--  let cell = take 4 (randomRs ('A','Z') gen) --大英字4桁をランダム生成
--  putStrLn cell
--  if cell == "STAP"
--    then putStrLn "You find STAP Cell!"
--    else main --mainを再帰

---- 次に思いついたやつ．でもこれでは無限に終わらない．
---- forM無限リスト
---- どうやって止めるのこれ...
--main = do
--  forM [1,2..] $ \i -> do
--    gen <- newStdGen
--    let cell = take 4 (randomRs ('A','Z') gen) --大英字4桁をランダム生成
--    if cell == "STAP"
--      then do
--      putStrLn $ "You found STAP Cell to" ++ show i ++ "th !"
--      return ()
--      else putStrLn cell
