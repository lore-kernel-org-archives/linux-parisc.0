From: Keith Owens <kaos@ocs.com.au>
Subject: Re: [parisc-linux] Re: [Linux-ia64] Announce: modutils 2.4.24 is available
Date: Sun, 23 Mar 2003 14:41:33 +1100
Message-ID: <8942.1048390893__12080.7555890226$1416622320$gmane$org@ocs3.intra.ocs.com.au>
References: <200303230337.h2N3bhAC026836@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: willy@debian.org, linux-kernel@vger.kernel.org,
	parisc-linux@parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-reply-to: Your message of "Sat, 22 Mar 2003 22:37:43 CDT."
             <200303230337.h2N3bhAC026836@hiauly1.hia.nrc.ca>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, 22 Mar 2003 22:37:43 -0500 (EST), 
"John David Anglin" <dave@hiauly1.hia.nrc.ca> wrote:
>> -#if defined(ARCH_ia64) || defined(ARCH_ppc64)
>> +#if defined(ARCH_ia64) || defined(ARCH_ppc64) || defined(ARCH_hppa64)
>>  #define HAS_FUNCTION_DESCRIPTORS
>>  #endif
>
>The 32-bit hppa port also has function descriptors.

They keep coming out of the woodwork :(  Any more architectures using
function descriptors?  Just add them to the list below.

Index: 24.3/include/util.h
--- 24.3/include/util.h Sun, 23 Mar 2003 13:34:28 +1100 kaos (modutils-2.4/51_util.h 1.4 644)
+++ 24.3(w)/include/util.h Sun, 23 Mar 2003 14:40:06 +1100 kaos (modutils-2.4/51_util.h 1.4 644)
@@ -96,7 +96,7 @@ void gzf_close(int fd);
 #define SYMPREFIX "__insmod_";
 extern const char symprefix[10];	/* Must be sizeof(SYMPREFIX), including nul */
 
-#if defined(ARCH_ia64) || defined(ARCH_ppc64)
+#if defined(ARCH_ia64) || defined(ARCH_ppc64) || defined(ARCH_hppa) || defined(ARCH_hppa64)
 #define HAS_FUNCTION_DESCRIPTORS
 #endif
 
