module Paths_cosmos (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/mlitchard/projects/git/cosmos/.stack-work/install/x86_64-linux/lts-4.2/7.10.3/bin"
libdir     = "/home/mlitchard/projects/git/cosmos/.stack-work/install/x86_64-linux/lts-4.2/7.10.3/lib/x86_64-linux-ghc-7.10.3/cosmos-0.0.0-1iqUX5FQjOsHFaPsFk56bu"
datadir    = "/home/mlitchard/projects/git/cosmos/.stack-work/install/x86_64-linux/lts-4.2/7.10.3/share/x86_64-linux-ghc-7.10.3/cosmos-0.0.0"
libexecdir = "/home/mlitchard/projects/git/cosmos/.stack-work/install/x86_64-linux/lts-4.2/7.10.3/libexec"
sysconfdir = "/home/mlitchard/projects/git/cosmos/.stack-work/install/x86_64-linux/lts-4.2/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cosmos_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cosmos_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "cosmos_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cosmos_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cosmos_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
