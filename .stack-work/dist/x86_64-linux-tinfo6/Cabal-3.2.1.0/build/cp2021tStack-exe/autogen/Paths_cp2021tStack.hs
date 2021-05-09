{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_cp2021tStack (
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

bindir     = "/home/goncalo/Documents/CP/CPtp2021/.stack-work/install/x86_64-linux-tinfo6/9d45db5260e8a1798a04b97a41edb87cec89ff5e76c3d42821fa6b1418461818/8.10.4/bin"
libdir     = "/home/goncalo/Documents/CP/CPtp2021/.stack-work/install/x86_64-linux-tinfo6/9d45db5260e8a1798a04b97a41edb87cec89ff5e76c3d42821fa6b1418461818/8.10.4/lib/x86_64-linux-ghc-8.10.4/cp2021tStack-0.1.0.0-2TiTXevZRgHGNxi9XovFLK-cp2021tStack-exe"
dynlibdir  = "/home/goncalo/Documents/CP/CPtp2021/.stack-work/install/x86_64-linux-tinfo6/9d45db5260e8a1798a04b97a41edb87cec89ff5e76c3d42821fa6b1418461818/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/goncalo/Documents/CP/CPtp2021/.stack-work/install/x86_64-linux-tinfo6/9d45db5260e8a1798a04b97a41edb87cec89ff5e76c3d42821fa6b1418461818/8.10.4/share/x86_64-linux-ghc-8.10.4/cp2021tStack-0.1.0.0"
libexecdir = "/home/goncalo/Documents/CP/CPtp2021/.stack-work/install/x86_64-linux-tinfo6/9d45db5260e8a1798a04b97a41edb87cec89ff5e76c3d42821fa6b1418461818/8.10.4/libexec/x86_64-linux-ghc-8.10.4/cp2021tStack-0.1.0.0"
sysconfdir = "/home/goncalo/Documents/CP/CPtp2021/.stack-work/install/x86_64-linux-tinfo6/9d45db5260e8a1798a04b97a41edb87cec89ff5e76c3d42821fa6b1418461818/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cp2021tStack_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cp2021tStack_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "cp2021tStack_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "cp2021tStack_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cp2021tStack_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cp2021tStack_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
