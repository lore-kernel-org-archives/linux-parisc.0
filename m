From: Helge Deller <deller@gmx.de>
Subject: [PATCH, v2] parisc: fix "make tar-pkg"
Date: Wed, 18 Feb 2009 23:12:21 +0100
Message-ID: <499C87C5.2000802@gmx.de>
References: <499A02A4.4060200@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <499A02A4.4060200@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 28574ae..b1fd48d 100644
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -75,6 +75,10 @@ case "${ARCH}" in
 	alpha)
 		[ -f "${objtree}/arch/alpha/boot/vmlinux.gz" ] && cp -v -- "${objtree}/arch/alpha/boot/vmlinux.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 		;;
+	parisc*)
+		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+		[ -f "${objtree}/lifimage" ] && cp -v -- "${objtree}/lifimage" "${tmpdir}/boot/lifimage-${KERNELRELEASE}"
+		;;
 	vax)
 		[ -f "${objtree}/vmlinux.SYS" ] && cp -v -- "${objtree}/vmlinux.SYS" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}.SYS"
 		[ -f "${objtree}/vmlinux.dsk" ] && cp -v -- "${objtree}/vmlinux.dsk" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}.dsk"
