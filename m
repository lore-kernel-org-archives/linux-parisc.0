Return-Path: <pjlahaie@puffingroup.com>
Sender: pjlahaie@puffingroup.com
Message-ID: <36C0A4A9.DD97CD75@atlsci.com>
Date: Tue, 09 Feb 1999 16:12:09 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@atlsci.com>
MIME-Version: 1.0
To: hppa-linux@puffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [hppa-linux] $global$ symbol -- help
Resent-Message-ID: <"DGPUc.0.aK2.C1Cms"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


   I will need some help to locate and fix this $global$ symbol
problem.  For that I
could use some help from someone with an MkLinux system to do the
following:

foo.c
int main_without__main()
{
}


extern void start() __asm__("start");
extern void _start() __asm__("_start");
extern void __start() __asm__("__start");

void start() {}
void _start() {}
void __start() {}
void mainCRTStartup() {}

And do the following:

gcc -S -c foo.c -o foo.S

   Also if you can send me the crt*.o files and the libgcc*.a (there's
also word on a libmilli*.[ao] file also), then I could like to see if
something is missing for these files.

						- Paul

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
