{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_task1 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/jwuensch/.cabal/bin"
libdir     = "/home/jwuensch/.cabal/lib/x86_64-linux-ghc-8.6.5/task1-0.1.0.0-inplace-task1"
dynlibdir  = "/home/jwuensch/.cabal/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/jwuensch/.cabal/share/x86_64-linux-ghc-8.6.5/task1-0.1.0.0"
libexecdir = "/home/jwuensch/.cabal/libexec/x86_64-linux-ghc-8.6.5/task1-0.1.0.0"
sysconfdir = "/home/jwuensch/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "task1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "task1_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "task1_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "task1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "task1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "task1_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
