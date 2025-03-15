import { create } from 'zustand'

export const useLoginStore = create((set) => ({
  loggedOn: true,
  logIn: () => set({ loggedOn: true }),
  logOut: () => set({ loggedOn: false }),
}))