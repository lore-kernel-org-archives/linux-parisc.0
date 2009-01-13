From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: remove unused local out_putf label
Date: Tue, 13 Jan 2009 20:54:25 +0100
Message-ID: <496CF171.6010506@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/hpux/fs.c b/arch/parisc/hpux/fs.c
index bd9a4db..5cbe9f9 100644
--- a/arch/parisc/hpux/fs.c
+++ b/arch/parisc/hpux/fs.c
@@ -137,7 +137,6 @@ int hpux_getdents(unsigned int fd, struct hpux_dirent __user *dirent, unsigned i
 			error = count - buf.count;
 	}
 
-out_putf:
 	fput(file);
 out:
 	return error;
