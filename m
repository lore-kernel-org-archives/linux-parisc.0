From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk-x+5WvRp7yOp+8FyH61/OPw@public.gmane.org>
Subject: [parisc-linux] OSS Harmony drivers still missing and ALSA not yet
 working = sound broken
Date: Sat, 13 Mar 2004 22:45:01 +0200 (EET)
Message-ID: <Pine.LNX.4.21.0403132243210.4150-100000__46244.0072828487$1416623262$gmane$org@hal.pp.fishpool.fi>
References: <Pine.LNX.4.21.0402201213540.1008-100000@hal.pp.fishpool.fi>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Cc: debian-hppa-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
To: parisc-linux-T/XaZq8tFt7U4lJK3ijXoz+iFHGzDt/a@public.gmane.org
Return-Path: <q-funk-x+5WvRp7yOp+8FyH61/OPw@public.gmane.org>
In-Reply-To: <Pine.LNX.4.21.0402201213540.1008-100000-4o3fW2yq+lqHldeZ0cibK8c4bpwCjbIv@public.gmane.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request-T/XaZq8tFt7U4lJK3ijXoz+iFHGzDt/a@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux-T/XaZq8tFt7U4lJK3ijXoz+iFHGzDt/a@public.gmane.org>
List-Help: <mailto:parisc-linux-request-T/XaZq8tFt7U4lJK3ijXoz+iFHGzDt/a@public.gmane.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request-T/XaZq8tFt7U4lJK3ijXoz+iFHGzDt/a@public.gmane.org?subject=subscribe>

This was the case in 2.6.3 and still is the case.

On Fri, 20 Feb 2004, Martin-=C9ric Racine wrote:

> Now that I notice, the old OSS driver fails to be included, even though i=
t was
> defined in the config:
>=20
> CONFIG_SOUND=3Dm
> CONFIG_SND=3Dm
> CONFIG_SND_SEQUENCER=3Dm
> CONFIG_SND_SEQ_DUMMY=3Dm
> CONFIG_SND_OSSEMUL=3Dy
> CONFIG_SND_MIXER_OSS=3Dm
> CONFIG_SND_PCM_OSS=3Dm
> CONFIG_SND_SEQUENCER_OSS=3Dy
> # CONFIG_SND_VERBOSE_PRINTK is not set
> # CONFIG_SND_DEBUG is not set
> CONFIG_SND_DUMMY=3Dm
> CONFIG_SND_VIRMIDI=3Dm
> # CONFIG_SND_MTPAV is not set
> # CONFIG_SND_SERIAL_U16550 is not set
> # CONFIG_SND_MPU401 is not set
> CONFIG_SND_HARMONY=3Dm
> # CONFIG_SOUND_PRIME is not set
> CONFIG_SOUND_HARMONY=3Dm
>=20
> <root@zarya:/root># tree /lib/modules/2.6.3-pa0/kernel/sound/
> /lib/modules/2.6.3-pa0/kernel/sound/
> |-- core
> |   |-- oss
> |   |   |-- snd-mixer-oss.ko
> |   |   `-- snd-pcm-oss.ko
> |   |-- seq
> |   |   |-- oss
> |   |   |   `-- snd-seq-oss.ko
> |   |   |-- snd-seq-device.ko
> |   |   |-- snd-seq-dummy.ko
> |   |   |-- snd-seq-midi-event.ko
> |   |   |-- snd-seq-virmidi.ko
> |   |   `-- snd-seq.ko
> |   |-- snd-page-alloc.ko
> |   |-- snd-pcm.ko
> |   |-- snd-rawmidi.ko
> |   |-- snd-timer.ko
> |   `-- snd.ko
> |-- drivers
> |   |-- snd-dummy.ko
> |   `-- snd-virmidi.ko
> |-- parisc
> |   `-- snd-harmony.ko
> `-- soundcore.ko
> =20
> 6 directories, 17 files

--=20
Martin-=C9ric Racine, ICT Consultant
http://www.pp.fishpool.fi/~q-funk/
