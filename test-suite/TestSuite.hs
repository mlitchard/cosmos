import qualified Test.Tasty
import Test.Tasty.Hspec

main :: IO ()
main = do
    test <- testSpec "cosmos" spec
    Test.Tasty.defaultMain test

spec :: Spec
spec = parallel $ do
    it "is trivially true" $ do
        True `shouldBe` True