From: Joel Soete <soete.joel@scarlet.be>
Subject: last git update of parisc-2.6.git failed again to merge???
Date: Sun, 07 Sep 2008 11:51:26 +0000
Message-ID: <48C3C03E.2050405@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Kyle,

Just fyi, my latest 'git pull' (this Sep 4 2008 around 8h gmt) of your tree 
<git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git> (again) failed to merge ;_(
 From git://git.eu.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6
  + 07f3b22...2c41408 master     -> origin/master  (forced update)
warning: too many files, skipping inexact rename detection
CONFLICT (rename/delete): Renamed include/asm-parisc/pdc.h->arch/parisc/include/asm/pdc.h in HEAD and deleted in 
2c41408cff1c81a5fe6980862f00e370a129c302
CONFLICT (rename/delete): Renamed include/asm-parisc/ropes.h->arch/parisc/include/asm/ropes.h in HEAD and deleted in 
2c41408cff1c81a5fe6980862f00e370a129c302
CONFLICT (rename/delete): Renamed include/asm-parisc/unistd.h->arch/parisc/include/asm/unistd.h in HEAD and deleted in 
2c41408cff1c81a5fe6980862f00e370a129c302
Removed Documentation/cli-sti-removal.txt
Removed Documentation/filesystems/configfs/configfs_example.c
Removed Documentation/powerpc/SBC8260_memory_mapping.txt
[snip]
Removed include/asm-sh/ubc.h
Removed include/asm-sh/watchdog.h
Removed include/linux/harrier_defs.h
Removed include/media/audiochip.h
Automatic merge failed; fix conflicts and then commit the result.

This was done with:
# git --version
git version 1.5.6.5

Any idea of what would I do better then re-clone tree
# git clone git://git.eu.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git parisc-2.6
Initialized empty Git repository in /Develop/parisc-linux/Kyle/parisc-2.6/.git/
remote: Counting objects: 895134, done.
remote: Compressing objects: 100% (147414/147414), done.
remote: Total 895134 (delta 746373), reused 895072 (delta 746330)
Receiving objects: 100% (895134/895134), 213.04 MiB | 94 KiB/s, done.
Resolving deltas: 100% (746373/746373), done.
Checking out files: 100% (24348/24348), done.


Tia,
	J.

PS: Nothing I can find with google, help me to fix this issue.
