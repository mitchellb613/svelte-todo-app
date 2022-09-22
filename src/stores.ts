import { writable } from "svelte/store";
import type { AuthSession } from "@supabase/supabase-js";

export const session = writable<AuthSession>();
