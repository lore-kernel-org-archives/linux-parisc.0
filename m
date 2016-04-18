From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/2] Persistent scrollback buffers for all VGA consoles
Date: Mon, 18 Apr 2016 22:38:37 +0200
Message-ID: <20160418203837.GA8008@jwilk.net>
References: <1461009418-1795-1-git-send-email-manuel.schoelling@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1;
	format=flowed
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jslaby-IBi9RG/b67k@public.gmane.org,
	thomas-8tQO0IXuy4gnETEX8uN03g@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org,
	tomi.valkeinen-l0cyMroinI0@public.gmane.org, jejb-6jwH94ZQLHl74goWV3ctuw@public.gmane.org, deller-Mmb7MZpHnFY@public.gmane.org,
	sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
	linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
	linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manuel =?iso-8859-1?Q?Sch=F6lling?= <manuel.schoelling-Mmb7MZpHnFY@public.gmane.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461009418-1795-1-git-send-email-manuel.schoelling-Mmb7MZpHnFY@public.gmane.org>
List-ID: <linux-usb.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Manuel Sch=F6lling <manuel.schoelling-Mmb7MZpHnFY@public.gmane.org>, 2016-04-18, 21:56:
>To offer a way for userland tools to flush the buffer my second patch=20
>adds a ioctl call for that.

In f8df13e0a901fe55631fed66562369b4dba40f8b, the escape sequence \e[3J=20
was added, which erases the whole display including the scroll-back=20
buffer. So the new ioctl shouldn't be necessary.

--=20
Jakub Wilk
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
